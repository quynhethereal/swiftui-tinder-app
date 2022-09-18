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

public enum ConfirmPasswordValidation {
    case unmatchedPassword
    case validConfirmPassword
    case isEmpty

    var errorMessage: String? {
        switch self {
        case .isEmpty:
            return "Confirm Password is empty."
        case .unmatchedPassword:
            return "The confirmation password doesn't match."
        case .validConfirmPassword:
            return nil
        }
    }
}
