//
//  User.swift
//  TinderApp (iOS)
//
//  Created by Le Helen on 02/09/2022.
//

import Foundation

struct UserProfile: Identifiable, Codable {
    var id = UUID()
    var name: String = ""
    var birthDate: Date =  Date(timeIntervalSinceReferenceDate: -123456789.0)
    var preferredTopic :[String] = [String]()
    var orientation: Orientation = Orientation.both
    var age: Int{
        return Date().years(from: birthDate)
    }
    
    //    init(){
    //        self.name = ""
    //        self.birthDate =  Date(timeIntervalSinceReferenceDate: -123456789.0)
    //        self.preferredTopic = [String]()
    //        self.orientation = Orientation.both
    //    }
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case birthDate
        case preferredTopic
        case orientation
        case age
    }
    
    init() { }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(UUID.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        birthDate = try values.decode(Date.self, forKey: .birthDate)
        preferredTopic = try values.decode(Array.self, forKey: .preferredTopic)
        orientation = try values.decode(Orientation.self, forKey: .orientation)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(birthDate, forKey: .birthDate)
        try container.encode(age, forKey: .age)
        try container.encode(id, forKey: .id)
        try container.encode(orientation, forKey: .orientation)
        try container.encode(preferredTopic, forKey: .preferredTopic)
    }
}

public enum Orientation: String, Codable, CaseIterable{
    case men, women, both
}
