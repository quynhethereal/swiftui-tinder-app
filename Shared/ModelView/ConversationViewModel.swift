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
    @Published var participant = Matcher()
    @Published var conversationId: String = String()
    
    var userId: String? {
        Auth.auth().currentUser?.uid
    }
    
    func fetchData() async {
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
    
    func getConversationId(matcherID: String) async{
        var docId = ""
        
        var userID = ""
        
        do {
            
            try userID = await db.collection("user_profiles").document(userId!).getDocument().get("id") as! String
            
        } catch {
            print ("can't get user id")
        }
        
        if (user != nil){
            db.collection("conversations").whereField("participants.\(userID)", isEqualTo: true).whereField("participants.\(matcherID)", isEqualTo: true).getDocuments(){
                (snapshot, error) in
                print("-=------------")
                print(userID)
                print(matcherID)
                guard let documents = snapshot?.documents else {
                    print("can't find conversation")
                    return
                }
                print(documents[0].data())
                                
                docId = documents[0].documentID
                
                print("-=------------")
                print(docId)
            }
        }
        self.conversationId = docId
    }
    
    func getParticipantInAConversation(conversationId: String) async {
        let currentUserDocumentRef = db.collection("user_profiles").document(userId!).path
        
        db.collection("conversations").whereField("participants", arrayContains: currentUserDocumentRef).getDocuments  { [self] (querySnapshot, error) in
            
            if let error = error {
                print("Error here: \(error)")
            } else {
                for document in querySnapshot!.documents {
                    var participantDocumentRef = ""
                    _ = document.data()
                    let participants = document.get("participants") as! [String]
                    
                    if (participants[0] == self.userId!){
                        participantDocumentRef = participants[1]
                    } else {
                        participantDocumentRef = participants[0]
                    }
                    
                    db.collection(participantDocumentRef).getDocuments() { (snapshot, error) in
                        
                        for  document in snapshot!.documents{
                            
                            var data = document.data()
                            
                            self.participant.images = data["images"] as? [String] ?? ["errorimage"]
                            self.participant.name = data["name"] as? String ?? "error name"
                        }
                        
                    }
                    
                }
                
            }
        }
    }
    
}

