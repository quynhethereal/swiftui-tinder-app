//
//  SignInView.swift
//  TinderApp (iOS)
//
//  Created by Le Helen on 02/09/2022.
//

import SwiftUI
import Firebase
import FirebaseAuthCombineSwift


struct SignInView: View {
    @EnvironmentObject var userViewModel: UserSignInViewModel
    @State var displayFailureAlert: Bool = false
    @State var failureMessage: String = "ab"
    
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
                Button(action: {signIn()}) {
                    Text("Sign In")
                }.disabled(!userViewModel.isValid)
            }
        }.alert(isPresented: $displayFailureAlert, content: {
            Alert(title: Text("Message"), message: Text(failureMessage), dismissButton: .destructive(Text("Ok")))
        })
    }
    
    func signIn(){
        Auth.auth().signIn(withEmail: userViewModel.username, password: userViewModel.password) { (result, error) in

            if let error = error {
                print("There was an issue when trying to sign in: \(error)")
                failureMessage = error.localizedDescription
                displayFailureAlert = true
                return
            }

            guard let user = result?.user else {
                  print("No user")
                  return
                }
            print("Signed in as user \(user.uid), with email: \(user.email ?? "")")
            userViewModel.loggedInSuccessfully = true
            // TODO: remove this
//            failureMessage = "haha"
//            displayFailureAlert = true
        }
    }
}



struct SignInView_Previews: PreviewProvider {
    static let signInViewModel = UserSignInViewModel()
    static var previews: some View {
        SignInView().environmentObject(signInViewModel)
    }
}
