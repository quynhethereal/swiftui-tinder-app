//
//  SwiftExtensions.swift
//  TinderApp
//
//  Created by Le Helen on 03/09/2022.
//

import Foundation

extension Date {
    /// Returns the amount of years from another date
    func years(from date: Date) -> Int {
        return Calendar.current.dateComponents([.year], from: date, to: self).year ?? 0
    }
}
