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


class ChatViewModel: ObservableObject {
    @Published var allMatches: [Matcher] = []
    
    private let db = Firestore.firestore()
    var userId: String? {
        Auth.auth().currentUser?.uid
    }
    
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
