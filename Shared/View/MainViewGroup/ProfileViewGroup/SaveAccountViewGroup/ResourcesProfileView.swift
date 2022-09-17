//
//  ResourcesProfileView.swift
//  Tinder-FE
//
//  Created by Gia Huy on 10/09/2022.
//

import SwiftUI

struct ResourcesProfileView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var guideActive: Bool
    @Binding var toolActive: Bool
    @Binding var rescActive: Bool
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer().frame(width: 20)
                    Button {
                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "multiply")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 20)
                            .foregroundColor(.black)
                    }
                    Spacer().frame(width: 45)
                    Text("Trung tâm An Toàn")
                        .font(.system(size: 26, weight: .bold, design: .default))
                        .foregroundColor(Color.black)
                    Spacer()
                }
                .padding()
                
                HStack {
                    Group {
                        Button {
                            guideActive = true
                            toolActive = false
                            rescActive = false
                        } label: {
                            Text("Hướng dẫn")
                                .foregroundColor(.gray)
                                .padding()
                        }
                        Divider().frame(height: 30)
                        Button {
                            guideActive = false
                            toolActive = true
                            rescActive = false
                        } label: {
                            Text("Công cụ")
                                .foregroundColor(.gray)
                                .padding()
                        }
                        Divider().frame(height: 30)
                        Button {
                            guideActive = false
                            toolActive = false
                            rescActive = true
                        } label: {
                            Text("Tài nguyên")
                                .padding()
                                .foregroundColor(.black)
                        }
                    }
                    .font(.system(size: 15, weight: .bold, design: .default))
                }
                Divider()
                HStack {
                    Text("Nguồn tham khảo")
                        .fontWeight(.bold)
                        .padding(.top, 5)
                        .padding(.leading, 50)
                    Spacer()
                }
                HStack {
                    Button {
                        if let url = URL(string: "https://mtch.com/safety#user_education") {
                                UIApplication.shared.open(url, options: [:], completionHandler: nil)
                        }
                    } label: {
                        Text("Truy cập trang web")
                            .foregroundColor(.black)
                            .modifier(ButtonOfFavoriteDisable())
                    }
                    .padding(.leading, 50)
                    Spacer()
                }
                Spacer()
            }
        }
    }
}

struct ResourcesProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ResourcesProfileView(guideActive: .constant(false), toolActive: .constant(false), rescActive: .constant(true))
    }
}
