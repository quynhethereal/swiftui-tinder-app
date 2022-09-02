//
//  LoginView.swift
//  TinderApp (iOS)
//
//  Created by Le Helen on 02/09/2022.
//

import SwiftUI



struct SignUpView: View {
    
    @ObservedObject var userViewModel = UserViewModel()
    
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
                Button(action: { }) {
                    Text("Sign up")
                }.disabled(!userViewModel.isValid)
            }
        }
    }
    
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
