//
//  PasswordValidation.swift
//  TinderApp (iOS)
//
//  Created by Le Helen on 02/09/2022.
//

import Foundation
public enum PasswordValidation {
    case emptyPassword
    case lessThanFiveCharacters
    case validPassword
    
    var errorMessage: String? {
        switch self {
        case .emptyPassword:
            return "Please enter a password"
        case .lessThanFiveCharacters:
            return "Less than 5 characters"
        case .validPassword:
            return nil
        }
    }
}
