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
    
    init(id: String){
        self.id = id
    }
}
