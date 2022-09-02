//
//  ConfirmPasswordValidation.swift
//  TinderApp (iOS)
//
//  Created by Le Helen on 02/09/2022.
//

import Foundation

public enum ConfirmPasswordValidation {
    case unmatchedPassword
    case validConfirmPassword
    case isEmpty

    var errorMessage: String? {
        switch self {
        case .isEmpty:
            return "Confirm Password is Empty"
        case .unmatchedPassword:
            return "The confirmation password doesn't match."
        case .validConfirmPassword:
            return nil
        }
    }
}
