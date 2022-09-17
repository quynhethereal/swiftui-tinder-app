//
//  Card.swift
//  TinderApp (iOS)
//
//  Created by Dat Duong on 13/09/2022.
//
import Foundation
import UIKit

struct Card: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let age: Int
    let state: String
    let activeStatus: [String] = ["Có hoạt động gần đây", "hoạt động ngoại tuyến"]
    /// Card x position
    var x: CGFloat = 0.0
    /// Card y position
    var y: CGFloat = 0.0
    /// Card rotation angle
    var degree: Double = 0.0
    
    static var data: [Card] {
        [
            Card(name: "Gin", imageName: "gin", age: 23, state: "Netherlands"),
            Card(name: "Vodka", imageName: "vodka", age: 26, state: "Russia"),
            Card(name: "Rum", imageName: "rum", age: 20, state: "Caribbean"),
            Card(name: "Tequila", imageName: "tequila", age: 21, state: "Mexico"),
            Card(name: "Chianti", imageName: "chianti", age: 21, state: "Italy"),
        ]
    }
    
}
