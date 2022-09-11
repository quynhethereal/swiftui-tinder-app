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
import CoreData

class ProfileRegistrationViewModel : ObservableObject{
    @Published var userProfile = UserProfile()
    @Published var countAddedImage: Int = 0
    private let db = Firestore.firestore()
    //    private let storage = Storage.storage().reference()
    private var userId: String? {
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
}
