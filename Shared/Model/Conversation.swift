//
//  Chatroom.swift
//  TinderApp (iOS)
//
//  Created by Le Helen on 18/09/2022.
//

import Foundation
import Firebase
class Conversation: Codable, Identifiable{
    var id: String
    var participants : [String] = [String]()
    var conversationCode: String
    
    init(id: String, conversationCode: String){
        self.id = id
        self.conversationCode = conversationCode
    }
}
