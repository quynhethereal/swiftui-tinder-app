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

// View Model to control the message of a message
class MessageViewModel: ObservableObject{
    @Published var messages = [Message]()
    
    private let db = Firestore.firestore()
    private let user = Auth.auth().currentUser
    
    func fetchMessagesInAChatRoom(docId: String){
        if (user != nil){
            db.collection("conversations").document(docId).collection("messages").order(by: "sentAt", descending: false).addSnapshotListener({(snapshot, error) in
                guard let documents = snapshot?.documents else {
                    print("There is no document")
                    return
                }
                
                self.messages = documents.map { docSnapshot  -> Message in
                    
                    let data = docSnapshot.data()
                    let docId = docSnapshot.documentID
                    let content = data["content"] as? String ?? ""
                    let sender = data["sender"] as? String ?? ""
                    let timestamp = data["timestamp"] as? String ?? ""
                    return Message(id: docId, content: content, sender: sender, timestamp: timestamp)
                }
            })
        }
    }
}
