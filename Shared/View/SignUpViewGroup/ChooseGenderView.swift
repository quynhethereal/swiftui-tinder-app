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

// View to Choose Gender
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
                        Text("I am")
                            .font(.system(size: 50, weight: .bold, design: .default))
                            .padding(.leading, 50)
                        Spacer()
                    }
                    .padding(.top, 100)
                    Spacer().frame(height: 100)
                    // Female button
                    Button {
                        self.isChooseFeMale = true
                        self.isChooseMale = false
                        self.isChooseOther = false
                    } label: {
                        if isChooseFeMale == true {
                            HStack {
                                Spacer()
                                Text("FEMALE")
                                Spacer()
                            }
                            .modifier(OutlineButtonEnable())
                        } else {
                            HStack {
                                Spacer()
                                Text("FEMALE")
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
                    // Male button
                    Button {
                        self.isChooseFeMale = false
                        self.isChooseMale = true
                        self.isChooseOther = false
                    } label: {
                        if isChooseMale == true {
                            HStack {
                                Spacer()
                                Text("MALE")
                                Spacer()
                            }
                            .modifier(OutlineButtonEnable())
                        } else {
                            HStack {
                                Spacer()
                                Text("MALE")
                                Spacer()
                            }
                            .modifier(OutlineButtonDisable())
                        }
                        
                    }
                    .padding(.horizontal, 30)
                    Spacer().frame(height: 15)
                    // Display more button
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
                        // Continue button
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
                            Text("NEXT")
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
