//
//  ChatroomViewModel.swift
//  TinderApp (iOS)
//
//  Created by Le Helen on 18/09/2022.
//

import SwiftUI
import Firebase

class ChatroomViewModel: ObservableObject {
    @Published var chatroom = [Chatroom]()
    private let db = Firestore.firestore()
    private let user = Auth.auth().currentUser
    
    
    
}

