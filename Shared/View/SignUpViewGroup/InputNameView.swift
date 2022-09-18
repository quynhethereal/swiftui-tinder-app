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

import SwiftUI
import Firebase
import FirebaseAuthCombineSwift

struct InputNameView: View {
    
    enum FocusField: Hashable {
        case field
    }
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var signUpVMGroup : ProfileRegistrationViewModel
    @State private var name = ""
    @FocusState private var focusedField: FocusField?
    @State private var disableButton: Bool = true
    @State private var showAlert = false
    @State private var selection: Int? = nil
    
    var body: some View {
        NavigationView {
            ZStack {
                showAlert ? Color.gray.ignoresSafeArea() : Color.white.ignoresSafeArea()
                VStack {
                    Spacer().frame(height: 80)
                    HStack {
                        Text("My name\nis")
                            .font(.system(size: 50, weight: .bold, design: .default))
                            .padding(.leading, 50)
                        Spacer()
                    }
                    Spacer().frame(height: 30)
                    TextField("Name", text: $name)
                        .focused($focusedField, equals: .field)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                self.focusedField = .field
                            }
                        }
                        .frame(width: 250)
                        .font(.title)
                        .foregroundColor(.black)
                        .underlineTextField()
                        .keyboardType(.default)
                    Text("This is how your name appears on matches and you won't be able to change it later")
                        .frame(width: 255)
                        .font(.system(size: 17, weight: .bold, design: .default))
                        .foregroundColor(Color("darkGrey"))
                    Spacer()
                    
                    NavigationLink(destination: InputBirthDay(), tag: 1,selection: $selection) {
                        Button() {
                            if(disableButton == false) {
                                signUpVMGroup.addName(name: name)
                                signUpVMGroup.name = name
                                self.selection = 1
                            }
                            
                        } label: {
                            if name.isEmpty {
                                Text("NEXT")
                                    .modifier(ButtonNextDisable())
                            } else {
                                Text("NEXT")
                                    .modifier(ButtonNextEnable())
                            }
                            
                        }
                        
                    }
                    .disabled(disableButton)
                    .padding(.horizontal, 30)
                    .onChange(of: self.name, perform: { _ in
                        if !name.isEmpty {
                            self.disableButton = false
                        } else {
                            self.disableButton = true
                        }
                    })
                    
                }
                .navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)
                .overlay(
                    Button(action: {
                        
                        showAlert.toggle()
                    }) {
                        Image("closeButton")
                            .resizable()
                            .scaledToFit()
                    }
                        .modifier(AddImageButtonModifier()),
                    alignment: .topLeading
                )
                .padding(20)
                .opacity(showAlert ? 0.3 : 1)
                
                
                if showAlert {
                    CustomAlertView(showAlert: $showAlert)
                }
            }
            
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        
    }
}

struct CustomAlertView: View {
    @Binding var showAlert: Bool
    var body: some View {
        
        ZStack {
            VStack {
                Spacer()
                Text("Are you leaving?")
                    .font(.system(size: 20, weight: .bold, design: .default))
                    .padding(.top, 20)
                Text("You will leave this registration page and all your information will be deleted")
                    .font(.system(size: 17, weight: .medium, design: .default))
                    .padding(.horizontal, 20)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 20)
                Spacer()
                Divider()
                    .frame(height: 2)
                HStack {
                    Button {
                        print(Auth.auth().currentUser!)
                        showAlert.toggle()
                    } label: {
                        HStack {
                            Spacer()
                            Text("NO")
                                .font(.system(size: 20, weight: .heavy, design: .default))
                                .foregroundColor(.gray)
                            Spacer()
                        }
                        
                    }
                    Spacer()
                    Divider()
                        .frame(width: 2)
                    Button {
                        UserDefaults.standard.set(false, forKey: "userlogin")
                        exit(0)
                    } label: {
                        HStack {
                            Spacer()
                            Text("YES")
                                .font(.system(size: 20, weight: .heavy, design: .default))
                                .foregroundColor(.red)
                            
                            Spacer()
                        }
                    }
                }
                Spacer()
            }
        }
        .frame(width: 350, height: 200, alignment: .center)
        .background(Color.white)
        .cornerRadius(10)
        .padding(.horizontal, 20)
    }
}

struct InputNameView_Previews: PreviewProvider {
    static var previews: some View {
        InputNameView()
    }
}
