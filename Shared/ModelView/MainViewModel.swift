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
import SwiftUI
import Firebase

// This is the View Model that keeps track of likes and dislikes of the current user (on swiping)
class MainViewModel: ObservableObject {
    @Published var allUsers: [Matcher] = []
    @Published var userProfile = UserProfile()
    var interactedUsers: [String] = [String]()
    
    private let db = Firestore.firestore()
    var userId: String? {
        Auth.auth().currentUser?.uid
    }
    
    var userEmail:String? {
        Auth.auth().currentUser?.email
    }
    
    func getEmail() -> String {
        return userEmail!
    }
    
    func getLoginUser() async {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let docRef = db.collection("user_profiles").document(userId!)
        docRef.getDocument { [self] (document, error) in
            if document!.exists {
                userProfile.id = UUID(uuidString: document? ["id"] as! String)!
                userProfile.images = [String](document?["images"] as! [String])
                userProfile.name = String(document?["name"] as! String)
                userProfile.orientation = Orientation(rawValue: document?["orientation"] as! String)!
                userProfile.preferredTopic = [String](document?["preferredTopic"] as! [String])
                userProfile.ageFromDB = Int(document?["age"] as! Int)
            } else {
                print("Document for user doesn't exist")
                return
                
            }
        }
    }
    
    // This function is to get the users that the users have interacted with (i.e like or dislike)
    func getAllInteractedUsers(completion: @escaping () -> Void) {
        
        let currentUserDocument = db.collection("user_profiles").document(self.userId!)
        
        currentUserDocument.getDocument()  { (document, error) in
            if let document = document, document.exists {
                // get likes
                
                if document.get("likes") is [String] {
                    self.interactedUsers.append(contentsOf: document.get("likes") as! [String])
                }
                
                // get dislikes
                
                if document.get("dislikes") is [String] {
                    self.interactedUsers.append(contentsOf: document.get("dislikes") as! [String])
                }
                
            }
            // completion callback
            completion()
        }
    }
    
    func getAllUser() async {
        getAllInteractedUsers {
            // callback
            
            // Filter by gender:
            // if user is male, exclude male out of all users
            // if user is female, exclude female out of all users
            // is user is both, they can see everyone :)
            let genderFilterCondition = self.getOppositeGender(gender: self.userProfile.orientation.rawValue)
            
            var collectionReference = self.db.collection("user_profiles").whereField("orientation", isNotEqualTo: self.userProfile.orientation.rawValue)
            
            if (genderFilterCondition == "both" ){
                collectionReference =  self.db.collection("user_profiles")
            }
            
            collectionReference.getDocuments() { (querySnapshot, err) in
                
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    
                    for (_,document) in querySnapshot!.documents.enumerated() {
                        if(document.documentID == self.userId) {
                            continue
                        }
                        
                        let id = document.get("id") as! String
                        
                        // if user has already liked or disliked sb
                        if (!self.interactedUsers.isEmpty){
                            
                            if (self.interactedUsers.contains(id)){
                                continue
                            }
                        }
                        
                        // create a Matcher object, then append this to all Users
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
    }
    
    // helper function to filter genders
    func getOppositeGender(gender:String) -> String{
        switch gender {
        case "men":
            return "women"
        case "women":
            return "men"
        case "both":
            return "both"
        default:
            return "both"
        }
    }
    
    
    func addToDislikes(matcherId:String){
        let currentUserDocument = db.collection("user_profiles").document(userId!)
        
        currentUserDocument.getDocument { (document, error) in
            if document!.exists {
                // add to dislikes array
                self.userProfile.dislikes.append(matcherId)
                currentUserDocument.updateData([
                    "dislikes": FieldValue.arrayUnion([matcherId])
                ])
                
            } else {
                print("Can't find dislikes array")
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
                    } else {
                        
                        for matcherDoc in snapshot!.documents {
                            
                            let matcherLikes = matcherDoc.get("likes") as? [String] ?? ["error"]
                            
                            // run when there is a match
                            if matcherLikes.contains(currentUserID as! String){
                                
                                let currentUserRef = self.db.document(currentUserDocument.path)
                                
                                let matcherRef = self.db.document(self.db.collection("user_profiles").document(matcherDoc.documentID).path)
                                
                                
                                self.db.collection("conversations").addDocument(data: [
                                    "participantsDocumentRef": FieldValue.arrayUnion([currentUserRef,matcherRef]),
                                    "participants": [
                                        "\(currentUserID as! String)": true,
                                        matcherId: true
                                    ]
                                ]) { (error) in
                                    print("Cannot create conversations")
                                }
                                
                                let ref = matcherDoc.reference
                                
                                ref.updateData([
                                    "matches": FieldValue.arrayUnion([currentUserID as! String])
                                ]);
                                currentUserDocument.updateData([
                                    "matches": FieldValue.arrayUnion([matcherId])
                                ])
                            }
                        }
                    }
                }
            } else {
                print("Can't find likes array")
            }
        }
    }
}
