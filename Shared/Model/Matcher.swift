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
import UIKit

// This model is the people who are the potential matchers. Technically, it is the same
// with the UserProfile but we want to make it explicit
struct Matcher: Identifiable, Codable, Hashable {
    var id: String = ""
    var name: String = ""
    //    var birthDate: Date! =  Date(timeIntervalSinceReferenceDate: -123456789.0)
    var preferredTopic :[String] = [String]()
    var gender = String()
    var age = Int()
    
    
    var images: [String] = [String]()
    
    /// Card x position
    var x: CGFloat = 0.0
    /// Card y position
    var y: CGFloat = 0.0
    /// Card rotation angle
    var degree: Double = 0.0
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case preferredTopic
        case gender
        case age
        case images
    }
    
    
    // manual decoder and encoder since not all the fields are sent
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(String.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        preferredTopic = try values.decode(Array.self, forKey: .preferredTopic)
        gender = try values.decode(String.self, forKey: .gender)
        images = try values.decode(Array.self, forKey: .images)
        age = try values.decode(Int.self, forKey: .age)
    }
    
    var dictionary: [String: Any] {
        let data = (try? JSONEncoder().encode(self)) ?? Data()
        return (try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any]) ?? [:]
    }
    
    init() {
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
