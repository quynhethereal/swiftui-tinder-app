//
//  MainViewModel.swift
//  TinderApp (iOS)
//
//  Created by Dat Duong on 13/09/2022.
//


import Foundation
import SwiftUI
import Firebase


class MainViewModel: ObservableObject {
    @Published var allUsers: [Matcher] = []
    @Published var userProfile = UserProfile()
    private let db = Firestore.firestore()
    var userId: String? {
        Auth.auth().currentUser?.uid
    }
    
    func getLoginUser() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let docRef = db.collection("user_profiles").document(userId!)
        docRef.getDocument { [self] (document, error) in
            if document!.exists {
                userProfile.id = UUID(uuidString: document?["id"] as! String)!
                userProfile.images = [String](document?["images"] as! [String])
                userProfile.name = String(document?["name"] as! String)
                userProfile.orientation = Orientation(rawValue: document?["orientation"] as! String)!
                userProfile.preferredTopic = [String](document?["preferredTopic"] as! [String])
                userProfile.ageFromDB = Int(document?["age"] as! Int)
            } else {
                return
                
            }
        }
    }
    
    func getAllUser() {
        
        db.collection("user_profiles").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for (index,document) in querySnapshot!.documents.enumerated() {
                    if(document.documentID == self.userId) {
                        continue
                    }
                    
                    print("-------------------------")
                    var potentialMatcher = Matcher()
                    
                    
                    potentialMatcher.id = String(document["id"] as! String)
                    potentialMatcher.images = [String](document["images"] as! [String])
                    potentialMatcher.name = String(document["name"] as! String)
                    potentialMatcher.gender = String(document["orientation"] as! String)
                    potentialMatcher.preferredTopic = [String](document["preferredTopic"] as! [String])
                    potentialMatcher.age = Int(document["age"] as! Int)
                    self.allUsers.append(potentialMatcher)
                }
            }
        }
    }
    
    func addToLikes(matcherId:String){
        let currentUserDocument = db.collection("user_profiles").document(userId!)
        let matcherDocument = db.collection("user_profiles").whereField("id", isEqualTo: "\(matcherId)")
            
        
        currentUserDocument.getDocument { (document, error) in
            
            if document!.exists {
                // add to likes array
                self.userProfile.likes.append(matcherId)
                currentUserDocument.updateData([
                    "likes": FieldValue.arrayUnion([matcherId])
                ])
                
                // check if there is a match
                matcherDocument.getDocuments{ (snapshot, error) in
                    let currentUserID = document?.get("id")
                    if let error = error {
                        print("error in matching....")
                        print(error)
                    }else {
                        
                        for matcherDoc in snapshot!.documents {
                            
                            
                            let matcherLikes = matcherDoc.get("likes") as! [String]
                            
                            // there is a match
                            if matcherLikes.contains(currentUserID as! String){
                                
                                let ref = matcherDoc.reference
            
                                ref.updateData([
                                    "matches": FieldValue.arrayUnion([currentUserID])
                                ]);
                                currentUserDocument.updateData([
                                    "matches": FieldValue.arrayUnion([matcherId])
                                ])
                            }
                        }
                    }
                }
            } else{
                print("Can't find likes array")
            }
        }
    }
}
