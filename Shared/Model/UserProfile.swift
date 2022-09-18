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

struct UserProfile: Identifiable, Codable {
    var id = UUID()
    var name: String = ""
    var birthDate: Date! =  Date(timeIntervalSinceReferenceDate: -123456789.0)

    var preferredTopic :[String] = [String]()
    var orientation: Orientation = Orientation.both
    var age: Int{
        return Date().years(from: birthDate)
    }
    
    var ageFromDB: Int = 20
    var likes:[String] = [String]()
    var matches:[String] = [String]()
    var dislikes:[String] = [String]()

    
    var images: [String] = [String]()
//        init(){
//            self.name = ""
//            self.birthDate =  Date(timeIntervalSinceReferenceDate: -123456789.0)
//            self.preferredTopic = [String]()
//            self.orientation = Orientation.both
//        }
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case birthDate
        case preferredTopic
        case orientation
        case age
        case images
        case likes
        case matches
        case dislikes
    }
    
    var dictionary: [String: Any] {
        let data = (try? JSONEncoder().encode(self)) ?? Data()
        return (try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any]) ?? [:]
    }
    
    init() {
        
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(UUID.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        birthDate = try values.decode(Date.self, forKey: .birthDate)
        preferredTopic = try values.decode(Array.self, forKey: .preferredTopic)
        orientation = try values.decode(Orientation.self, forKey: .orientation)
        images = try values.decode(Array.self, forKey: .images)
        likes = try values.decode(Array.self, forKey: .likes)
        matches = try values.decode(Array.self, forKey: .matches)
        dislikes = try values.decode(Array.self, forKey: .dislikes)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(birthDate, forKey: .birthDate)
        try container.encode(name, forKey: .name)
        try container.encode(age, forKey: .age)
        try container.encode(id, forKey: .id)
        try container.encode(orientation, forKey: .orientation)
        try container.encode(preferredTopic, forKey: .preferredTopic)
        try container.encode(images, forKey: .images)
        try container.encode(likes, forKey: .likes)
        try container.encode(matches, forKey: .matches)
        try container.encode(dislikes, forKey: .dislikes)
    }
    
    
}

public enum Orientation: String, Codable, CaseIterable{
    case men, women, both
}
