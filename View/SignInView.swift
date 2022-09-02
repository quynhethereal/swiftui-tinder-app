//
//  SignInView.swift
//  TinderApp (iOS)
//
//  Created by Le Helen on 02/09/2022.
//

import SwiftUI
import Firebase

struct SignInView: View {
    @ObservedObject var userViewModel = UserSignInViewModel()

    var body: some View {
        
        Form {
            Section(footer: Text(userViewModel.userNameError ?? "" ).foregroundColor(.red)) {
                TextField("Username", text: $userViewModel.username)
                    .autocapitalization(.none)
            }
            Section(footer: Text(userViewModel.passwordError ?? "" ).foregroundColor(.red)) {
                SecureField("Password", text: $userViewModel.password)
            }
            Section {
                Button(action: { }) {
                    Text("Sign In")
                }.disabled(!userViewModel.isValid)
            }
        }
    }
    
    func signIn(){
        Auth.auth().signIn(withEmail: userViewModel.username, password: userViewModel.password) { (result, err) in
        }
    }
}



struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
