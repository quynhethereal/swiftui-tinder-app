//
//  LoginView.swift
//  TinderApp (iOS)
//
//  Created by Le Helen on 02/09/2022.
//

import SwiftUI

import Firebase



struct SignUpView: View {
    
    @StateObject var userViewModel = UserSignUpViewModel()
    @Binding var isActive: Bool
    
    var body: some View {
        Form {
            Section(footer: Text(userViewModel.userNameError ?? "" ).foregroundColor(.red)) {
                TextField("Username", text: $userViewModel.username)
                    .autocapitalization(.none)
            }
            Section(footer: Text(userViewModel.passwordError ?? "" ).foregroundColor(.red)) {
                SecureField("Password", text: $userViewModel.password)
                SecureField("Password again", text: $userViewModel.confirmPassword)
            }
            Section {
                Button(action: {signUp()}) {
                    Text("Sign up")
                }.disabled(!userViewModel.isValid)
                
                Button(action: {isActive = true}) {
                    Text("Sign In View")
                }
            }
        }
    }
    
    func signUp(){
        Auth.auth().createUser(withEmail: userViewModel.username, password: userViewModel.password) {
            (result,err) in
            
        }
    }
    
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(isActive: .constant(true))
    }
}
