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

class ProfileRegistrationViewModel : ObservableObject{
    @Published var userProfile = UserProfile()
    @Published var countAddedImage: Int = 0
    private let db = Firestore.firestore()
    //    private let storage = Storage.storage().reference()
    var userId: String? {
        Auth.auth().currentUser?.uid
        
    }
    
    func addTopic(topic: String) {
        userProfile.preferredTopic.append(topic)
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
