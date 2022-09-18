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

class Message: Codable, Identifiable, Hashable{
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
    
    public func hash(into hasher: inout Hasher) {
        return hasher.combine(id)
    }
    
    public static func == (lhs: Message, rhs: Message) -> Bool {
        return lhs.id == rhs.id
    }

}



