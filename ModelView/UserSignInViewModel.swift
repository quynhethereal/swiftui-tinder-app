//
//  UserSignInViewModel.swift
//  TinderApp
//
//  Created by Le Helen on 02/09/2022.
//

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
    
    
    private var cancellableSet: Set<AnyCancellable> = []
    
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
