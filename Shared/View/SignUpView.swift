//
//  LoginView.swift
//  TinderApp (iOS)
//
//  Created by Le Helen on 02/09/2022.
//

import SwiftUI

import Firebase



struct SignUpView: View {
    @EnvironmentObject var userAuth: UserSignInViewModel
    @StateObject var userViewModel = UserSignUpViewModel()
    @Binding var isActive: Bool
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("lightPink"), Color("lightRed")]), startPoint: .leading, endPoint: .trailing)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
//                MARK: - LOGO
                Image("tinderLabel")
                    .resizable()
                    .scaledToFit()
                    .frame(minWidth: 150, idealWidth: 200, maxWidth: 200, alignment: .center)
                    .padding(.vertical, 70)
//                MARK: - LABEL
                Text(userViewModel.getAttributedString("By clicking SIGN UP, you agree to our Terms. Learn about how we handle your data in our Privacy Policy and Cookie Policy."))
                    .font(.system(size: 17, weight: .medium, design: .default))
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 20)
                Group {
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

                Spacer().frame(height: 15)
                HStack {
                    Spacer()
                    Image("lock")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                        .padding(.leading, 10)
                    Section {
                            SecureField("", text: $userViewModel.confirmPassword).frame(maxWidth: .infinity, minHeight: 55)
                                .font(.system(size: 17, weight: .medium, design: .default))
                                .placeholder(when: userViewModel.confirmPassword.isEmpty){
                                    Text("Password Confirm").foregroundColor(.white).opacity(0.5)
                                }

                        }
                    Spacer()
                }.overlay(
                    Capsule(style: .circular)
                                .stroke(Color.white, style: StrokeStyle(lineWidth: 3))
                ).padding(.horizontal, 3)
                Text(userViewModel.passwordError ?? "" )
                    .foregroundColor(.white)
                Spacer().frame(height: 15)
                //MARK: - SIGN UP BUTTON
                Button(action: {
                    signUp()
                },
                label: {
                    HStack {
                        Text("SIGN UP").foregroundColor(.white)
                            .frame(maxWidth: .infinity, minHeight: 55)
                            .tint(.white)
                            .font(.system(size: 20, weight: .medium, design: .default))
                    }
                    .overlay(
                        Capsule(style: .circular)
                                    .stroke(Color.white, style: StrokeStyle(lineWidth: 3))
                    )
                }).disabled(!userViewModel.isValid)
                .padding(.horizontal, 3)
                VStack{
                    Text("Already have account ?").foregroundColor(.white)
                        .frame(maxWidth: .infinity, minHeight: 20)
                        .tint(.white)
                        .font(.system(size: 20, weight: .medium, design: .default))
                    Button(action: {isActive = true},
                           label: {
                            Text("SIGN IN").foregroundColor(.white)
                                .tint(.white)
                                .font(.system(size: 20, weight: .medium, design: .default))
                    })
                }
            }
            }
            .padding(20)
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
        }
    }
    
    func signUp(){
        Auth.auth().createUser(withEmail: userViewModel.username, password: userViewModel.password) {
            (result,err) in
            if result != nil {
                self.isActive = true
            }
            
        }
    }
    
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(isActive: .constant(true))
    }
}
