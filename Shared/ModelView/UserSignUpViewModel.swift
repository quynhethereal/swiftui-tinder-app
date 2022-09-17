//
//  UserData.swift
//  TinderApp (iOS)
//
//  Created by Le Helen on 02/09/2022.
//

import Foundation
import Combine
import SwiftUI


class UserSignUpViewModel : ObservableObject{
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    
    @Published var isValid: Bool = false
    @Published var userNameError: String?
    @Published var passwordError: String?
    
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
    private var cancellableSet: Set<AnyCancellable> = []
    
       init() {
           
           isValidUserNamePublisher
                 .receive(on: RunLoop.main)
                 .map { usernameCheck in
                   switch usernameCheck {
                   case .emptyUsername:
                     return "Username must not be empty."
                   case .inValidUsername:
                    return "Username must be an email. Example: john@gmail.com."
                   case .lessThanThreeCharacters:
                    return "Username cannot be less than 3 characters."
                   default:
                     return ""
                   }
                 }
                 .assign(to: \.userNameError, on: self)
                 .store(in: &cancellableSet)
           
           isValidConfirmPasswordPublisher
               .receive(on: RunLoop.main)
               .map { confirmPasswordCheck in
                   switch confirmPasswordCheck {
                   case .isEmpty:
                       return "Confirm Password must not be empty."
                   case .unmatchedPassword:
                       return "Confirm Password doesn't match."
                   default:
                       return ""
            
                   }
               }
               .assign(to: \.passwordError, on: self)
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
           
           Publishers.CombineLatest3(self.isValidUserNamePublisher, self.isValidConfirmPasswordPublisher, self.isValidPasswordPublisher)
               .dropFirst()
               .sink { _usernameValidator,_confirmPaswordValidator, _passwordValidator in
                   
                   self.isValid = _usernameValidator.errorMessage == nil &&
                   _confirmPaswordValidator.errorMessage == nil && _passwordValidator.errorMessage == nil
           }
           .store(in: &cancellableSet)
           
           isValidUserNamePublisher
           .dropFirst()
               .sink { (_usernameValidator) in
                   self.userNameError = _usernameValidator.errorMessage
               }
           .store(in: &cancellableSet)
           
           isValidConfirmPasswordPublisher
                   .dropFirst()
                      .sink { (_confirmPaswordValidator) in
                          self.passwordError = _confirmPaswordValidator.errorMessage
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
                } else if !_username.isEmailValid {
                    return .inValidUsername
                } else if _username.count <= 3 {
                    return .lessThanThreeCharacters
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
                } else if _password.count <= 5 {
                    return .lessThanFiveCharacters
                }
                else {
                    return .validPassword
                }
            }
            .eraseToAnyPublisher()
    }
    
    
    private var isValidConfirmPasswordPublisher: AnyPublisher<ConfirmPasswordValidation, Never> {
           $confirmPassword
               .debounce(for: 0.0, scheduler: RunLoop.main)
               .map { confirmPassword in
                   if confirmPassword.isEmpty {
                       return .isEmpty
                   } else if self.password != confirmPassword {
                       return .unmatchedPassword
                   } else {
                       return .validConfirmPassword
                   }
           }
           .eraseToAnyPublisher()
       }
}

extension String {
    var isEmailValid: Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailPred.evaluate(with: self)
    }
}


