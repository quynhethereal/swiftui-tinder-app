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
    var body: some View {
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
                    self.showingOtherGenderChoose = true
                } label: {
                    if isChooseOther == true {
                        HStack {
                            Spacer()
                            Text("HIỂN THỊ THÊM")
                                .offset(x: 20)
                            Spacer()
                            Image(systemName: "control")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 20)
                                .rotationEffect(.degrees(90))
                            Spacer().frame(width: 15)
                        }
                        .modifier(OutlineButtonEnable())
                    } else {
                        HStack {
                            Spacer()
                            Text("HIỂN THỊ THÊM")
                                .offset(x: 20)
                            Spacer()
                            Image(systemName: "control")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 20)
                                .rotationEffect(.degrees(90))
                            Spacer().frame(width: 15)
                        }
                        .modifier(OutlineButtonDisable())
                    }
                    
                }
                .padding(.horizontal, 30)
                Spacer()
                //MARK: - BUTTON TIẾP TỤC
                Button {
                    
                } label: {
                    Text("TIẾP TỤC")
                        .modifier(ButtonNextEnable())
                }
                .padding(.horizontal, 30)
                Spacer().frame(height: 70)
            }
            .overlay(
                Button(action: {
                    
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
        .sheet(isPresented: $showingOtherGenderChoose) {
            OtherGenderView()
        }
    }
}

struct OtherGenderView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var signUpVMGroup = ProfileRegistrationViewModel()
    @State private var ischooseMale: Bool = true
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    Text("Giới tính")
                        .font(.system(size: 26, weight: .bold, design: .default))
                        .foregroundColor(Color.black)
                        .padding(.top, 15)
                    Spacer()
                }
                Form {
                    Section(header: Text("TÔI LÀ").font(.system(size: 20, weight: .bold))) {
                        TextField("Nhập thông tin", text: $signUpVMGroup.gender)
                            .frame(width: .infinity, height: 50)
                            .textFieldStyle(.plain)
                    }
                    Section(header: Text("CÓ THỂ TÌM TÔI THEO GIỚI TÍNH").font(.system(size: 20, weight: .bold))) {
                        Button {
                            ischooseMale = true
                        } label: {
                            HStack {
                                Text("Nam")
                                    .font(.system(size: 20, weight: .regular))
                                    .foregroundColor(.black)
                                Spacer()
                                if ischooseMale == true {
                                    Image(systemName: "checkmark")
                                        .font(.system(size: 20, weight: .heavy))
                                        .foregroundColor(Color("lightPink"))
                                }
                            }
                        }
                        Button {
                            ischooseMale = false
                        } label: {
                            HStack {
                                Text("Nữ")
                                    .font(.system(size: 20, weight: .regular))
                                    .foregroundColor(.black)
                                Spacer()
                                if ischooseMale == false {
                                    Image(systemName: "checkmark")
                                        .font(.system(size: 20, weight: .heavy))
                                        .foregroundColor(Color("lightPink"))
                                }
                            }
                        }
                    }
                }
                .padding(.horizontal, -25)
            }
            .overlay(
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Xong")
                        .font(.system(size: 26, weight: .bold, design: .default))
                        .foregroundColor(Color("lightRed"))
                        .padding(.top, 25)
                }
                    .modifier(ClosePresentViewButton()),alignment: .topTrailing
            )
        }
    }
}


struct ChooseGenderView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseGenderView()
        OtherGenderView()
    }
}
