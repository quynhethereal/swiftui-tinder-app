//
//  EditProfileView.swift
//  Tinder-FE
//
//  Created by Gia Huy on 10/09/2022.
//

import SwiftUI

struct EditProfileView: View {
    @Binding var active: Bool
    @Environment(\.presentationMode) var presentationMode
    @StateObject var signUpVMGroup = ProfileRegistrationViewModel()
    @State private var toggleTest = true
    @State private var testText = ""
    @State private var testPicker = "Trống"
    var body: some View {
        ZStack {
            VStack {
                VStack {
                    HStack {
                        Spacer()
                        Text("Sửa thông tin")
                            .font(.system(size: 26, weight: .bold, design: .default))
                            .foregroundColor(Color.black)
                            .padding(.top, 25)
                        Button {
                            self.presentationMode.wrappedValue.dismiss()
                        } label: {
                            Text("Xong")
                                .font(.system(size: 26, weight: .bold, design: .default))
                                .foregroundColor(Color("lightRed"))
                                .modifier(ClosePresentViewButton())
                                .padding(.top, 25)
                        }
                        Spacer().frame(width: 15)
                    }
                    HStack {
                        Spacer()
                        Button {
                            self.active = true
                        } label: {
                            Text("Chỉnh sửa")
                                .font(.system(size: 25, weight: .heavy, design: .default))
                                .foregroundColor(Color("lightPink"))
                        }
                        Spacer()
                        Divider().frame(height: 40)
                        Spacer()
                        Button {
                            self.active = false
                        } label: {
                            Text("Xem trước")
                                .font(.system(size: 25, weight: .heavy, design: .default))
                                .foregroundColor(.gray)
                        }
                        Spacer()
                    }
                    .padding(25)
                }
                .frame(height: 150)
                .background(.white.opacity(0.7))
                
                VStack {
                    NavigationView {
                        Form {
                            Section {} header: {
                                Group {
                                    HStack {
                                        ZStack {
                                            Image(signUpVMGroup.imageArray[0])
                                                .resizable()
                                                .modifier(ImageModifier())
                                                .overlay(
                                                    Button(action: {
                                                        addOrDeleteImage(0, imageName: "gin")
                                                    }) {
                                                        if !signUpVMGroup.imageArray[0].contains("localimage") {
                                                            LinearGradient(gradient: Gradient(colors: [Color("lightPink"), Color("lightRed")]), startPoint: .leading, endPoint: .trailing)
                                                                        .mask(Image(systemName: "multiply.circle")
                                                                        .resizable()
                                                                        .aspectRatio(contentMode: .fit)
                                                            )
                                                        } else {
                                                            LinearGradient(gradient: Gradient(colors: [Color("lightPink"), Color("lightRed")]), startPoint: .leading, endPoint: .trailing)
                                                                        .mask(Image(systemName: "plus.circle.fill")
                                                                        .resizable()
                                                                        .aspectRatio(contentMode: .fit)
                                                            )
                                                        }
                                                    }
                                                    .modifier(AddImageButtonModifier()),
                                                    alignment: .bottomTrailing
                                                )
                                        }
                                        .frame(width: 100, height: 160)
                                        Spacer().frame(width: 30)
                                        ZStack {
                                            Image(signUpVMGroup.imageArray[1])
                                                .resizable()
                                                .modifier(ImageModifier())
                                                .overlay(
                                                    Button(action: {
                                                        addOrDeleteImage(1, imageName: "rum")
                                                    }) {
                                                        if !signUpVMGroup.imageArray[1].contains("localimage") {
                                                            LinearGradient(gradient: Gradient(colors: [Color("lightPink"), Color("lightRed")]), startPoint: .leading, endPoint: .trailing)
                                                                        .mask(Image(systemName: "multiply.circle")
                                                                        .resizable()
                                                                        .aspectRatio(contentMode: .fit)
                                                            )
                                                        } else {
                                                            LinearGradient(gradient: Gradient(colors: [Color("lightPink"), Color("lightRed")]), startPoint: .leading, endPoint: .trailing)
                                                                        .mask(Image(systemName: "plus.circle.fill")
                                                                        .resizable()
                                                                        .aspectRatio(contentMode: .fit)
                                                            )
                                                        }
                                                    }
                                                    .modifier(AddImageButtonModifier()),
                                                    alignment: .bottomTrailing
                                                )
                                        }
                                        .frame(width: 100, height: 160)
                                        Spacer().frame(width: 30)
                                        ZStack {
                                            Image(signUpVMGroup.imageArray[2])
                                                .resizable()
                                                .modifier(ImageModifier())
                                                .overlay(
                                                    Button(action: {
                                                        addOrDeleteImage(2, imageName: "vodka")
                                                    }) {
                                                        if !signUpVMGroup.imageArray[2].contains("localimage") {
                                                            LinearGradient(gradient: Gradient(colors: [Color("lightPink"), Color("lightRed")]), startPoint: .leading, endPoint: .trailing)
                                                                        .mask(Image(systemName: "multiply.circle")
                                                                        .resizable()
                                                                        .aspectRatio(contentMode: .fit)
                                                            )
                                                        } else {
                                                            LinearGradient(gradient: Gradient(colors: [Color("lightPink"), Color("lightRed")]), startPoint: .leading, endPoint: .trailing)
                                                                        .mask(Image(systemName: "plus.circle.fill")
                                                                        .resizable()
                                                                        .aspectRatio(contentMode: .fit)
                                                            )
                                                        }
                                                    }
                                                    .modifier(AddImageButtonModifier()),
                                                    alignment: .bottomTrailing
                                                )
                                        }
                                        .frame(width: 100, height: 160)
                                    }
                                    
                                    HStack {
                                        ZStack {
                                            Image(signUpVMGroup.imageArray[3])
                                                .resizable()
                                                .modifier(ImageModifier())
                                                .overlay(
                                                    Button(action: {
                                                        addOrDeleteImage(3, imageName: "vodka")
                                                    }) {
                                                        if !signUpVMGroup.imageArray[3].contains("localimage") {
                                                            LinearGradient(gradient: Gradient(colors: [Color("lightPink"), Color("lightRed")]), startPoint: .leading, endPoint: .trailing)
                                                                        .mask(Image(systemName: "multiply.circle")
                                                                        .resizable()
                                                                        .aspectRatio(contentMode: .fit)
                                                            )
                                                        } else {
                                                            LinearGradient(gradient: Gradient(colors: [Color("lightPink"), Color("lightRed")]), startPoint: .leading, endPoint: .trailing)
                                                                        .mask(Image(systemName: "plus.circle.fill")
                                                                        .resizable()
                                                                        .aspectRatio(contentMode: .fit)
                                                            )
                                                        }
                                                    }
                                                    .modifier(AddImageButtonModifier()),
                                                    alignment: .bottomTrailing
                                                )
                                        }
                                        .frame(width: 100, height: 160)
                                        Spacer().frame(width: 30)
                                        ZStack {
                                            Image(signUpVMGroup.imageArray[4])
                                                .resizable()
                                                .modifier(ImageModifier())
                                                .overlay(
                                                    Button(action: {
                                                        addOrDeleteImage(4, imageName: "gin")
                                                    }) {
                                                        if !signUpVMGroup.imageArray[4].contains("localimage") {
                                                            LinearGradient(gradient: Gradient(colors: [Color("lightPink"), Color("lightRed")]), startPoint: .leading, endPoint: .trailing)
                                                                        .mask(Image(systemName: "multiply.circle")
                                                                        .resizable()
                                                                        .aspectRatio(contentMode: .fit)
                                                            )
                                                        } else {
                                                            LinearGradient(gradient: Gradient(colors: [Color("lightPink"), Color("lightRed")]), startPoint: .leading, endPoint: .trailing)
                                                                        .mask(Image(systemName: "plus.circle.fill")
                                                                        .resizable()
                                                                        .aspectRatio(contentMode: .fit)
                                                            )
                                                        }
                                                    }
                                                    .modifier(AddImageButtonModifier()),
                                                    alignment: .bottomTrailing
                                                )
                                        }
                                        .frame(width: 100, height: 160)
                                        Spacer().frame(width: 30)
                                        ZStack {
                                            Image(signUpVMGroup.imageArray[5])
                                                .resizable()
                                                .modifier(ImageModifier())
                                                .overlay(
                                                    Button(action: {
                                                        addOrDeleteImage(5, imageName: "gin")
                                                    }) {
                                                        if !signUpVMGroup.imageArray[5].contains("localimage") {
                                                            LinearGradient(gradient: Gradient(colors: [Color("lightPink"), Color("lightRed")]), startPoint: .leading, endPoint: .trailing)
                                                                        .mask(Image(systemName: "multiply.circle")
                                                                        .resizable()
                                                                        .aspectRatio(contentMode: .fit)
                                                            )
                                                        } else {
                                                            LinearGradient(gradient: Gradient(colors: [Color("lightPink"), Color("lightRed")]), startPoint: .leading, endPoint: .trailing)
                                                                        .mask(Image(systemName: "plus.circle.fill")
                                                                        .resizable()
                                                                        .aspectRatio(contentMode: .fit)
                                                            )
                                                        }
                                                    }
                                                    .modifier(AddImageButtonModifier()),
                                                    alignment: .bottomTrailing
                                                )
                                        }
                                        .frame(width: 100, height: 160)
                                    }
                                }
                                .padding()
                            } footer: {
                                Text("Thêm video, ảnh hoặc loop để hoàn thành thêm 4% hồ sơ của bạn, cùng cơ hội nhận được nhiều lượt Thích hơn.")
                                    .padding(.horizontal)
                                    .padding()
                                    .foregroundColor(.gray)
                            }

                            Section {
                                Toggle("Ảnh Thông Minh", isOn: $toggleTest)
                                    .toggleStyle(SwitchToggleStyle(
                                        tint: Color("lightRed")
                                    ))
                            } header: {
                                Text("TUỲ CHỌN HÌNH ẢNH")
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundColor(.black)
                            } footer: {
                                Text("Tính năng Ảnh Thông Minh liên tục xem xét toàn bộ ảnh hồ sơ của bạn và chọn ra ảnh đẹp nhất hiển thị trước")
                            }
                            
                            Section {
                                TextEditor(text: $testText)
                                    .frame(height: 70)
                            } header: {
                                Text("GIỚI THIỆU BẢN THÂN")
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundColor(.black)
                            }
                            
                            Section {
                                Picker("võ thuật, phim ảnh, game online", selection: $testPicker) {
                                    
                                }
                            } header: {
                                Text("SỞ THÍCH")
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundColor(.black)
                            }
                            
                            Section {
                                Picker("\(Image(systemName: "moon.stars")) Cung hoàng đạo", selection: $testPicker) {
                                    Text("Trống").tag("Trống")
                                }
                                Picker("\(Image(systemName: "fork.knife.circle")) Chế độ ăn uống", selection: $testPicker) {
                                    Text("Trống").tag("Trống")
                                }
                                Picker("\(Image(systemName: "pawprint")) Thú cưng", selection: $testPicker) {
                                    Text("Trống").tag("Trống")
                                }
                                Picker("\(Image(systemName: "graduationcap")) Giáo dục", selection: $testPicker) {
                                    Text("Trống").tag("Trống")
                                }
                                Picker("🚬 Hút thuốc", selection: $testPicker) {
                                    Text("Trống").tag("Trống")
                                }
                            } header: {
                                Text("PHONG CÁCH SỐNG")
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundColor(.black)
                            }
                            
                            Section {
                                TextField("Thêm công ty", text: $testText)
                                    .frame(width: .infinity, height: 50)
                                    .textFieldStyle(.plain)
                            } header: {
                                Text("CÔNG TY")
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundColor(.black)
                            }
                            
                            Section {
                                Picker("RMIT University VietNam", selection: $testPicker) {
                                }
                            } header: {
                                Text("TRƯỜNG")
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundColor(.black)
                            }
                            Section {
                                Picker("Thêm thành phố", selection: $testPicker) {
                                }
                            } header: {
                                Text("ĐANG SỐNG TẠI")
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundColor(.black)
                            }
                        }
                        .padding(.horizontal, -25)
                        .navigationBarBackButtonHidden(true)
                        .navigationBarHidden(true)
                    }
                    
                    Spacer()
                }
            }
        }
    }
    func addOrDeleteImage(_ position: Int, imageName: String) {
        if signUpVMGroup.imageArray[position].contains("localimage") {
            signUpVMGroup.imageArray[position] = imageName
            signUpVMGroup.countAddedImage += 1
        } else if !signUpVMGroup.imageArray[position].contains("localimage") {
            signUpVMGroup.imageArray[position] = "localimage"
            signUpVMGroup.countAddedImage -= 1
        }
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView(active: .constant(true))
    }
}
