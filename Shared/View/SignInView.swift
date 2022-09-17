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
    @StateObject var userProfile = ProfileRegistrationViewModel()
    @State var displayFailureAlert: Bool = false
    @State var failureMessage: String = "ab"
    @Binding var isActive: Bool
    var body: some View {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color("lightPink"), Color("lightRed")]), startPoint: .leading, endPoint: .trailing)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Spacer()
                    //MARK: - LOGO
                    Image("tinderLabel")
                        .resizable()
                        .scaledToFit()
                        .frame(minWidth: 150, idealWidth: 200, maxWidth: 200, alignment: .center)
                        .padding(.vertical, 70)
                    //MARK: - LABEL
                    Text(userViewModel.getAttributedString("By clicking SIGN IN, you agree to our Terms. Learn about how we handle your data in our Privacy Policy and Cookie Policy."))
                        .font(.system(size: 17, weight: .medium, design: .default))
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 20)
                    Group{
                        //MARK: - USERNAME
                        
                        HStack {
                            Spacer()
                            Image("person")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 25)
                                .padding(.leading, 10)
                            Section {
                                TextField("", text: $userViewModel.username).frame(maxWidth: .infinity, minHeight: 55)
                                    .foregroundColor(.white)
                                    .font(.system(size: 17, design: .default))
                                    .autocapitalization(.none)
                                    .placeholder(when: userViewModel.username.isEmpty){
                                        Text("Username").foregroundColor(.white).opacity(0.5)
                                    }
                            }
                            Spacer()
                        }
                        .overlay(
                            Capsule(style: .circular)
                                .stroke(Color.white, style: StrokeStyle(lineWidth: 3))
                        ).padding(.horizontal, 3)
                        Text(userViewModel.userNameError ?? "" )
                            .foregroundColor(.white)
                        Spacer().frame(height: 15)
                        
                        //MARK: - PASSWORD
                        
                        HStack {
                            Spacer()
                            Image("lock")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 25)
                                .padding(.leading, 10)
                            Section {
                                SecureField("", text: $userViewModel.password).frame(maxWidth: .infinity, minHeight: 55)
                                    .font(.system(size: 17, weight: .medium, design: .default))
                                    .placeholder(when: userViewModel.password.isEmpty){
                                        Text("Password").foregroundColor(.white).opacity(0.5)
                                    }
                                
                            }
                            Spacer()
                        }
                        .overlay(
                            Capsule(style: .circular)
                                .stroke(Color.white, style: StrokeStyle(lineWidth: 3))
                        ).padding(.horizontal, 3)
                        Text(userViewModel.passwordError ?? "" )
                            .foregroundColor(.white)
                        Spacer()
                            .frame(height: 15)
                        
                        //MARK: - SIGN IN BUTTON
                        Button(action: {
                            signIn()
                        },
                               label: {
                            HStack {
                                Text("SIGN IN").foregroundColor(.white)
                                    .frame(maxWidth: .infinity, minHeight: 55)
                                    .tint(.white)
                                    .font(.system(size: 20, weight: .medium, design: .default))
                                
                                Spacer()
                            }
                            .overlay(
                                Capsule(style: .circular)
                                    .stroke(Color.white, style: StrokeStyle(lineWidth: 3))
                            )
                        }).disabled(!userViewModel.isValid)
                            .padding(.horizontal, 3)
                        VStack{
                            Text("Don't have account ?").foregroundColor(.white)
                                .frame(maxWidth: .infinity, minHeight: 20)
                                .tint(.white)
                                .font(.system(size: 20, weight: .medium, design: .default))
                            Button(action: {isActive = false},
                                   label: {
                                Text("SIGN UP").foregroundColor(.white)
                                    .tint(.white)
                                    .font(.system(size: 20, weight: .medium, design: .default))
                                
                                
                                
                                
                            })
                        }
                        
                        
                    }.alert(isPresented: $displayFailureAlert, content: {
                        Alert(title: Text("Message"), message: Text(failureMessage), dismissButton: .destructive(Text("Ok")))
                    })
                }
//                    .overlay(
//                        //MARK: - BUTTON BACK
//                        Button(action: {
//                            isActive = false
//                        }) {
//                            Image("grayBackButton")
//                                .resizable()
//                                .scaledToFit()
//                        }
//                            .modifier(BackButtonModifier()),
//                        alignment: .topLeading
//                    )
                    .padding(20)
                    .navigationBarBackButtonHidden(true)
                    .navigationBarHidden(true)
                
            }
        
        
        
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
            userProfile.fetchUserProfile()
            
            print("Signed in as user \(user.uid), with email: \(user.email ?? "")")
            
            userViewModel.loggedInSuccessfully = true
            UserDefaults.standard.set(userViewModel.loggedInSuccessfully, forKey: "userlogin")
            
        }
    }
}



struct SignInView_Previews: PreviewProvider {
    static let signInViewModel = UserSignInViewModel()
    static var previews: some View {
        SignInView(isActive: .constant(true)).environmentObject(signInViewModel)
    }
}
