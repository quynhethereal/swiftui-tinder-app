//
//  User.swift
//  TinderApp (iOS)
//
//  Created by Le Helen on 02/09/2022.
//

import Foundation
import UIKit

struct Matcher: Identifiable, Codable {
    var id: String = ""
    var name: String = ""
//    var birthDate: Date! =  Date(timeIntervalSinceReferenceDate: -123456789.0)

    var preferredTopic :[String] = [String]()
    var gender = String()
    var age = Int()

    
    var images: [String] = [String]()
//        init(){
//            self.name = ""
//            self.birthDate =  Date(timeIntervalSinceReferenceDate: -123456789.0)
//            self.preferredTopic = [String]()
//            self.orientation = Orientation.both
//        }
    
    /// Card x position
    var x: CGFloat = 0.0
    /// Card y position
    var y: CGFloat = 0.0
    /// Card rotation angle
    var degree: Double = 0.0
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
//        case birthDate
        case preferredTopic
        case gender
        case age
        case images
    }
    
    var dictionary: [String: Any] {
        let data = (try? JSONEncoder().encode(self)) ?? Data()
        return (try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any]) ?? [:]
    }
    
    init() {
        
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(String.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        preferredTopic = try values.decode(Array.self, forKey: .preferredTopic)
        gender = try values.decode(String.self, forKey: .gender)
        images = try values.decode(Array.self, forKey: .images)
        age = try values.decode(Int.self, forKey: .age)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(age, forKey: .age)
        try container.encode(id, forKey: .id)
        try container.encode(gender, forKey: .gender)
        try container.encode(preferredTopic, forKey: .preferredTopic)
        try container.encode(images, forKey: .images)
    }
    
    
}

//public enum Gender: String, Codable, CaseIterable{
//    case men, women, both
//}
