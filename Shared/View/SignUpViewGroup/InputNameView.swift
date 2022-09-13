//
//  InputNameView.swift
//  Tinder-FE
//
//  Created by Gia Huy on 07/09/2022.
//

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
                        Text("Tên tôi\n là")
                            .font(.system(size: 50, weight: .bold, design: .default))
                            .padding(.leading, 50)
                        Spacer()
                    }
                    Spacer().frame(height: 30)
                    TextField("Tên", text: $name)
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
                    Text("Đây là cách tên bạn hiển thị trên tinder và bạn sẽ không thể thay đổi về sau")
                        .frame(width: 255)
                        .font(.system(size: 17, weight: .bold, design: .default))
                        .foregroundColor(Color("darkGrey"))
                    Spacer()
                    
                    //MARK: - BUTTON SUBMIT
//                    Button() {
//                        signUpVMGroup.addName(name: name)
//
//
//                    } label: {
//                        if signUpVMGroup.name.isEmpty {
//                            Text("TIẾP TỤC")
//                                .modifier(ButtonNextDisable())
//                        } else {
//                            Text("TIẾP TỤC")
//                                .modifier(ButtonNextEnable())
//                        }
//
//                    }
//                    .disabled(disableButton)
//                    .padding(.horizontal, 30)
//                    .onChange(of: self.name, perform: { _ in
//                        if !name.isEmpty {
//                            self.disableButton = false
//                        } else {
//                            self.disableButton = true
//                        }
//                    })
                    
                    NavigationLink(destination: InputBirthDay(), tag: 1,selection: $selection) {
                        Button() {
                            if(disableButton == false) {
                                signUpVMGroup.addName(name: name)
                                signUpVMGroup.name = name
                                self.selection = 1
                            }
                            
                        } label: {
                            if signUpVMGroup.name.isEmpty {
                                Text("TIẾP TỤC")
                                    .modifier(ButtonNextDisable())
                            } else {
                                Text("TIẾP TỤC")
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
                Text("Bạn có chắc không?")
                    .font(.system(size: 20, weight: .bold, design: .default))
                    .padding(.top, 20)
                Text("Bạn sẽ rời khỏi trang đăng ký này và tẩt cả thông tin của bạn sẽ bị xoá")
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
                            Text("KHÔNG")
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
                            Text("CÓ")
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
