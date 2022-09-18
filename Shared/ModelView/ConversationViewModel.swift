//
//  ChatroomViewModel.swift
//  TinderApp (iOS)
//
//  Created by Le Helen on 18/09/2022.
//

import SwiftUI
import Firebase

class ConversationViewModel: ObservableObject {
    @Published var conversations = [Conversation]()
    private let db = Firestore.firestore()
    private let user = Auth.auth().currentUser
    
    func fetchData() {
        if (user != nil){
            db.collection("no conversations").whereField("users", arrayContains: user!.uid).addSnapshotListener({( snapshot, error ) in
                guard let documents = snapshot?.documents else {
                    print("users have no conversations")
                    
                    return
                }
                
                self.conversations = documents.map({ docSnapshot -> Conversation  in
                    let data = docSnapshot.data()
                    let docId = docSnapshot.documentID
                    let conversationCode = data["conversationCode"] as? String ?? ""
                    return Conversation(id: docId, conversationCode: conversationCode)
                })
            })
        }
    }
}
