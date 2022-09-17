//
//  ChatViewModel.swift
//  TinderApp (iOS)
//
//  Created by Le Helen on 17/09/2022.
//

import Foundation
import Firebase


class ChatViewModel: ObservableObject {
    @Published var allMatches: [Matcher] = []
    
    private let db = Firestore.firestore()
    var userId: String? {
        Auth.auth().currentUser?.uid
    }
    
    var NO_MATCHES = [Matcher]()
    
//    func allImage() -> [String] {
//        
//    }
    
    func getAllMatchesProfiles() {
        let currentUserDocument = db.collection("user_profiles").document(userId!)
        
        currentUserDocument.getDocument { (document, error) in
            
            let matches = document!.get("matches") as! [String]
            
            if (matches.isEmpty){
                return
            } else {
                for match in matches {
                    
                    let documentQuery = self.db.collection("user_profiles").whereField("id", isEqualTo: match).limit(to:1)
                    
                    documentQuery.getDocuments{ (matchMatcherSnapshot, error) in
                        for doc in matchMatcherSnapshot!.documents {
                            var matchedMatcher = Matcher()
                            if((self.allMatches.first {$0.id == doc.get("id") as! String}) == nil) {
                                matchedMatcher.id = doc.get("id") as! String
                                matchedMatcher.images = doc.get("images") as! [String]
                                matchedMatcher.name = doc.get("name") as! String
                                matchedMatcher.gender = doc.get("orientation") as! String
                                matchedMatcher.preferredTopic = doc.get("preferredTopic") as! [String]
                                matchedMatcher.age = doc.get("age") as! Int
                                self.allMatches.append(matchedMatcher)
                            } else {
                                continue
                            }
                            
                            
                        }
                    }
                    
                }
            }
        }
    }
}
