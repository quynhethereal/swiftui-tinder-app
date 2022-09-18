//
//  Message.swift
//  TinderApp (iOS)
//
//  Created by Le Helen on 18/09/2022.
//

import Foundation

class Message: Codable, Identifiable{
    var id: String = ""
    var content: String = ""
    var timestamp: String = ""
    var sender: String = ""
    
    init(id: String, content: String, sender: String, timestamp: String){
        self.id = id
        self.content = content
        self.sender = sender
        self.timestamp = timestamp
    }
}



