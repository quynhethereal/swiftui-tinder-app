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

import SwiftUI
import Firebase

class ConversationViewModel: ObservableObject {
    @Published var conversations = [Conversation]()
    private let db = Firestore.firestore()
    private let user = Auth.auth().currentUser
    
    var userId: String? {
        Auth.auth().currentUser?.uid
    }
    
    func fetchData() {
        if (user != nil){
            
            db.collection("conversations").whereField("participants", arrayContains: user!.uid).addSnapshotListener({( snapshot, error ) in
                guard let documents = snapshot?.documents else {
                    print("users have no conversations")
                    return
                }
                
                self.conversations = documents.map({ docSnapshot -> Conversation  in
                    let data = docSnapshot.data()
                    let docId = docSnapshot.documentID
                    return Conversation(id: docId)
                })
            })
        }
    }
    
    func getParticipantInAConversation(conversationId: String) {
        let currentUserDocumentRef = db.collection("user_profiles").document(userId!).path
        
        db.collection("conversations").whereField("participants", arrayContains: currentUserDocumentRef).getDocuments  { (document, error) in
            
            
            
        }
    }
    
}

