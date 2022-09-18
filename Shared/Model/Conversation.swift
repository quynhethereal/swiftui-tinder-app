//
//  Chatroom.swift
//  TinderApp (iOS)
//
//  Created by Le Helen on 18/09/2022.
//

import Foundation
import Firebase
class Conversation: Codable, Identifiable, Hashable{
    var id: String
    var participants : [String] = [String]()
    
    init(id: String){
        self.id = id
    }
    public func hash(into hasher: inout Hasher) {
        return hasher.combine(id)
    }
    
    public static func == (lhs: Conversation, rhs: Conversation) -> Bool {
        return lhs.id == rhs.id
    }
}
