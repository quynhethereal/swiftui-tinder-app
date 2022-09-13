//
//  ChooseGenderView.swift
//  Tinder-FE
//
//  Created by Gia Huy on 07/09/2022.
//

import SwiftUI

struct ChooseGenderView: View {
    @State private var isChooseMale: Bool = false
    @State private var isChooseFeMale: Bool = true
    @State private var isChooseOther: Bool = false
    @State private var showingOtherGenderChoose: Bool = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var selection: Int? = nil
    @EnvironmentObject var userRegisterVM : ProfileRegistrationViewModel
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    HStack {
                        Text("Tôi là")
                            .font(.system(size: 50, weight: .bold, design: .default))
                            .padding(.leading, 50)
                        Spacer()
                    }
                    .padding(.top, 100)
                    Spacer().frame(height: 100)
                    //MARK: - BUTTON NỮ
                    Button {
                        self.isChooseFeMale = true
                        self.isChooseMale = false
                        self.isChooseOther = false
                    } label: {
                        if isChooseFeMale == true {
                            HStack {
                                Spacer()
                                Text("NỮ")
                                Spacer()
                            }
                            .modifier(OutlineButtonEnable())
                        } else {
                            HStack {
                                Spacer()
                                Text("NỮ")
                                    .frame(maxWidth: .infinity, minHeight: 55)
                                    .foregroundColor(.gray)
                                    .font(.system(size: 25, weight: .bold, design: .default))
                                Spacer()
                            }
                            .overlay(
                                Capsule(style: .circular)
                                    .stroke(Color.gray, style: StrokeStyle(lineWidth: 3))
                            )
                        }
                        
                    }
                    .padding(.horizontal, 30)
                    Spacer().frame(height: 15)
                    //MARK: - BUTTON NAM
                    Button {
                        self.isChooseFeMale = false
                        self.isChooseMale = true
                        self.isChooseOther = false
                    } label: {
                        if isChooseMale == true {
                            HStack {
                                Spacer()
                                Text("NAM")
                                Spacer()
                            }
                            .modifier(OutlineButtonEnable())
                        } else {
                            HStack {
                                Spacer()
                                Text("NAM")
                                Spacer()
                            }
                            .modifier(OutlineButtonDisable())
                        }
                        
                    }
                    .padding(.horizontal, 30)
                    Spacer().frame(height: 15)
                    //MARK: - BUTTON HIỂN THỊ THÊM
                    Button {
                        self.isChooseFeMale = false
                        self.isChooseMale = false
                        self.isChooseOther = true
                    } label: {
                        if isChooseOther == true {
                            HStack {
                                Spacer()
                                Text("OTHER")
                                Spacer()

                            }
                            .modifier(OutlineButtonEnable())
                        } else {
                            HStack {
                                Spacer()
                                Text("OTHER")
                                Spacer()
                            }
                            .modifier(OutlineButtonDisable())
                        }
                        
                    }
                    .padding(.horizontal, 30)
                    Spacer()
                    NavigationLink(destination: MyFavouriteView(), tag: 1,selection: $selection) {
                        //MARK: - BUTTON TIẾP TỤC
                        Button {
                            if(isChooseMale) {
                                userRegisterVM.addGender(gender: "men")
                            } else if (isChooseFeMale) {
                                userRegisterVM.addGender(gender: "women")
                            } else {
                                userRegisterVM.addGender(gender: "both")
                            }
                            self.selection = 1
                            print(userRegisterVM.userProfile.orientation)
                        } label: {
                            Text("TIẾP TỤC")
                                .modifier(ButtonNextEnable())
                        }
                    }
                    .padding(.horizontal, 30)
                    Spacer().frame(height: 70)
                }
                .overlay(
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                      Image("darkGrayBackButton")
                            .resizable()
                            .scaledToFit()
                    }
                    .modifier(BackButtonModifier()),
                    alignment: .topLeading
                )
                .padding(20)
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)

    }
}



struct ChooseGenderView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseGenderView()
//        OtherGenderView()
    }
}
