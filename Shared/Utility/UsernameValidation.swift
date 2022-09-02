//
//  UsernameValidation.swift
//  TinderApp (iOS)
//
//  Created by Le Helen on 02/09/2022.
//

import Foundation

public enum UsernameValidation {
    case emptyUsername
    case inValidUsername
    case validUsername
    case lessThanThreeCharacters
    var errorMessage: String? {
        switch self {
        case .emptyUsername:
            return "Username is empty"
        case .inValidUsername:
            return "Invalid username"
        case .lessThanThreeCharacters:
            return "Less than 3 characters"
        case .validUsername:
            return nil
        }
    }
}
