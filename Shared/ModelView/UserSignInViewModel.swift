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
import Combine
import SwiftUI

class UserSignInViewModel : ObservableObject{
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var userNameError: String?
    @Published var passwordError: String?
    @Published var isValid: Bool = false
    @Published var loggedInSuccessfully: Bool = false
    
//    @Published var isRegister: Bool = false
    
    
    private var cancellableSet: Set<AnyCancellable> = []

    
    //Return Attributed String and Hyperlink
    func getAttributedString(_ string: String) -> AttributedString {
        var attributedString = AttributedString(string)
        //Apllying bold and underline to hyperlink
        if let range = attributedString.range(of: "Terms") {
            
            attributedString[range].underlineStyle = .single
            attributedString[range].underlineColor = .white
            attributedString[range].font = .system(size: 17, weight: .bold)
            attributedString[range].link = .init(string: "https://policies.tinder.com/terms/intl/en")
            attributedString[range].foregroundColor = .white
        }
        if let range = attributedString.range(of: "Privacy Policy") {
            
            attributedString[range].underlineStyle = .single
            attributedString[range].underlineColor = .white
            attributedString[range].font = .system(size: 17, weight: .bold)
            attributedString[range].link = .init(string: "https://policies.tinder.com/privacy/intl/en")
            attributedString[range].foregroundColor = .white
        }
        if let range = attributedString.range(of: "Cookie Policy") {
            
            attributedString[range].underlineStyle = .single
            attributedString[range].underlineColor = .white
            attributedString[range].font = .system(size: 17, weight: .bold)
            attributedString[range].link = .init(string: "https://policies.tinder.com/cookie-policy/intl/en")
            attributedString[range].foregroundColor = .white
        }
        return attributedString
    }
    
    init() {
        
        isValidUserNamePublisher
              .receive(on: RunLoop.main)
              .map { usernameCheck in
                switch usernameCheck {
                case .emptyUsername:
                  return "Username must not be empty."
                default:
                  return ""
                }
              }
              .assign(to: \.userNameError, on: self)
              .store(in: &cancellableSet)
        
        isValidPasswordPublisher
            .receive(on: RunLoop.main)
            .map { passwordCheck in
                switch passwordCheck {
                case .emptyPassword:
                    return "Password must not be empty."
                case .lessThanFiveCharacters:
                    return "Password cannot be less than 5 characters."
                default:
                    return ""
         
                }
            }
            .assign(to: \.passwordError, on: self)
            .store(in: &cancellableSet)
        
        Publishers.CombineLatest(self.isValidUserNamePublisher, self.isValidPasswordPublisher)
            .dropFirst()
            .sink { _usernameValidator, _passwordValidator in
                
                self.isValid = _usernameValidator.errorMessage == nil && _passwordValidator.errorMessage == nil
        }
        .store(in: &cancellableSet)
        
        isValidUserNamePublisher
        .dropFirst()
            .sink { (_usernameValidator) in
                self.userNameError = _usernameValidator.errorMessage
            }
        .store(in: &cancellableSet)
        
        isValidPasswordPublisher
                .dropFirst()
                   .sink { (_paswordValidator) in
                       self.passwordError = _paswordValidator.errorMessage
                   }
                   .store(in: &cancellableSet)
        
    }
    
    
    private var isValidUserNamePublisher: AnyPublisher<UsernameValidation, Never> {
        $username
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { _username in
                if _username.isEmpty{
                    return .emptyUsername
                }
                else {
                    return .validUsername
                }
            }
            .eraseToAnyPublisher()
    }
    
    private var isValidPasswordPublisher: AnyPublisher<PasswordValidation, Never> {
        $password
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { _password in
                if _password.isEmpty{
                    return .emptyPassword
                }
                else {
                    return .validPassword
                }
            }
            .eraseToAnyPublisher()
    }
}
