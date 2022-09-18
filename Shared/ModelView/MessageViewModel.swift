//
//  MessageViewModel.swift
//  TinderApp (iOS)
//
//  Created by Le Helen on 18/09/2022.
//

import Foundation
import Firebase

class MessageViewModel: ObservableObject{
    @Published var messages = [Message]()
    
    private let db = Firestore.firestore()
    private let user = Auth.auth().currentUser
    
    func sendMessage(messageContent: String, docId: String){
        if (user != nil ){
            db.collection("conversations").document(docId).collection("messages").addDocument(data: [
                "sentAt": Date(),
                "content": messageContent,
                "sender": user!.uid
            ])
        }
    }
    
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
