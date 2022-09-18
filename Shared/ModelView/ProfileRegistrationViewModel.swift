/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2022B
 Assessment: Assignment 3
 Author: Error Team
 Duong Tuan Dat - s3636739
 Le Trung Kim - s3634824
 Le Dinh Ngoc Quynh - s3791159
 Thuan Nguyen - s3517236
 Created  date: 27/08/2022
 Last modified: 18/09/2022
 Acknowledgement: Acknowledge the resources that you use here.
 */

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseStorage
import AVFAudio

// View Model to handle register new profile flow
class ProfileRegistrationViewModel : ObservableObject{
    @Published var userProfile = UserProfile()
    @Published var name = ""
    @Published var gender = ""
    @Published var birthDay: Date = Date()
    @Published var favouriteArray: [String] = []
    @Published var countAddedImage: Int = 0
    @Published var isFetching = Bool()
    @Published var isfetching = true
    @Published var imageArray: [String] = ["localimage","localimage","localimage","localimage","localimage","localimage"]
    private let db = Firestore.firestore()
    var userId: String? {
        Auth.auth().currentUser?.uid
    }
    
    func addBithDay(date:Date) {
        userProfile.birthDate = date
    }
    
    func addTopic(topic: String) {
        userProfile.preferredTopic.append(topic)
        print(userProfile.name)
        print(userProfile.birthDate!)
        print(userProfile.orientation)
    }
    
    func addGender(gender:String) {
        if(gender == "men") {
            userProfile.orientation = Orientation.men
        } else if(gender == "women") {
            userProfile.orientation = Orientation.women
        } else {
            userProfile.orientation = Orientation.both
        }
        print(userProfile.name)
        print(userProfile.birthDate!)
    }
    
    func addName(name:String) {
        if(!name.isEmpty) {
            let trimmedName = name.trimmingCharacters(in: .whitespaces)
            userProfile.name = trimmedName
        }
        print(userProfile.name)
        
    }
    
    
    // add a new UserProfile document to Firebase
    func createNewProfile(userProfile: UserProfile, completion: @escaping (Error?) -> ()) {
        do {
            try db.collection("user_profiles").document(userId!).setData(from: userProfile) { (error) in
            }
        } catch {
            completion(error)
            return
        }
        
    }
    
    // check if the user has set their profile. If already set their profile, redirect to home page screen.
    // If not, they will need to input basic information first
    func fetchUserProfile(){
        let docRef = db.collection("user_profiles").document(userId!)
        docRef.getDocument { (document, error) in
            if document!.exists {
                print("User existed in user table")
                
                UserDefaults.standard.set(true, forKey: "userprofile")
                self.isfetching = false
            } else {
                print("no exist")
                
                UserDefaults.standard.set(false, forKey: "userprofile")
                self.isfetching = false
                
            }
        }
        
    }
    
    
    
    //    func uploadMedia(completion: @escaping (_ url: String?) -> Void) {
    //        
    //        let storageRef = Storage.storage().reference().child("\(Auth.auth().currentUser?.uid ?? "").png")
    //
    //        if let uploadData = self.imgUploadView.image?.jpegData(compressionQuality: 0.5) {
    //                storageRef.putData(uploadData, metadata: nil) { (metadata, error) in
    //                    if error != nil {
    //                        print("error")
    //                        completion(nil)
    //                    } else {
    //
    //                        storageRef.downloadURL(completion: { (url, error) in
    //
    //                            print(url?.absoluteString)
    //                            completion(url?.absoluteString)
    //                        })
    //
    //                      //  completion((metadata?.downloadURL()?.absoluteString)!))
    //                        // your uploaded photo url.
    //
    //
    //                    }
    //                }
    //            }
    //    }
}
