//
//  ProfileRegistrationViewModel.swift
//  TinderApp
//
//  Created by Le Helen on 03/09/2022.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseStorage
import AVFAudio

class ProfileRegistrationViewModel : ObservableObject{
    @Published var userProfile = UserProfile()
    @Published var name = ""
    @Published var gender = ""
    @Published var birthDay = ""
    @Published var favouriteArray: [String] = []
    @Published var countAddedImage: Int = 0
    @Published var userExist = Bool()
    private let db = Firestore.firestore()
    //    private let storage = Storage.storage().reference()
    var userId: String? {
        Auth.auth().currentUser?.uid
        
    }
    
    func addBithDay(date:String) {
        var str = "29011997"
//        var str = date
        str.insert(contentsOf: "/", at: str.index(str.startIndex, offsetBy: 2))
        str.insert(contentsOf: "/", at: str.index(str.startIndex, offsetBy: 5))
        print(str)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        userProfile.birthDate = dateFormatter.date(from: str)
        print(name)
        print(userProfile.name)
        print(userProfile.birthDate!)
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
    
    
    
    func createNewProfile(userProfile: UserProfile, completion: @escaping (Error?) -> ()) {
        do {
            try db.collection("user_profiles").document(userId!).setData(from: userProfile) { (error) in
            }
        } catch {
            completion(error)
            return
        }
          
    }
    @MainActor
    func fetchUserProfile() {
        let docRef = db.collection("user_profiles").document(userId!)
        docRef.getDocument { (document, error) in
            if document!.exists {
                print("User existed in user table")
                self.userExist = true
                UserDefaults.standard.set(true, forKey: "userprofile")
            } else {
                print("no exist")
                self.userExist = false
                UserDefaults.standard.set(false, forKey: "userprofile")
                
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
