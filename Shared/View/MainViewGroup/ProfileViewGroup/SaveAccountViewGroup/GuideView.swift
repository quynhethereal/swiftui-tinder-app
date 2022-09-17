//
//  GuideView.swift
//  Tinder-FE
//
//  Created by Gia Huy on 10/09/2022.
//

import SwiftUI

struct GuideView: View {
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
                                .foregroundColor(.black)
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
                                .foregroundColor(.gray)
                        }
                    }
                    .font(.system(size: 15, weight: .bold, design: .default))
                }
                Divider()
                NavigationView {
                    VStack {
                        HStack {
                            VStack {
                                Text("Xin chào Vodka")
                                    .font(.system(size: 40, weight: .bold, design: .default))
                                    .offset(x: -20)
                                Text("Dưới đây là tất cả những gì bạn cần biết về vấn đề an toàn")
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                            Image("vodka")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 40, height: 40)
                                .clipShape(Circle())
                            Spacer()
                        }
                        .padding()
                        Text("An toàn")
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading)
                        NavigationLink {
                            GuideChild1()
                        } label: {
                            HStack {
                                Image("saveProfile2")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 110)
                                    
                                VStack {
                                    Text("Thông tin cơ bản")
                                        .fontWeight(.bold)
                                        .padding(.leading, -60)
                                    Text("Những điều bạn cần biết để an toàn hơn trên Tinder và khi gặp gỡ ngoài đời - tất cả ở cùng 1 nơi")
                                        .multilineTextAlignment(.leading)
                                        .font(.caption)
                                    
                                }
                                .foregroundColor(.black)
                                Image(systemName: "chevron.up")
                                    .foregroundColor(.black)
                                    .rotationEffect(.degrees(90))
                                Spacer()
                            }
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .modifier(ShadowModifier())
                            
                            
                        }
                        .padding(.horizontal, 15)
                        Spacer().frame(height: 50)
                        Text("Quấy rối")
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading)
                        NavigationLink {
                            GuideChild2()
                        } label: {
                            HStack {
                                Image("saveProfile3")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 110)
                                VStack {
                                    Text("Cách xử lý")
                                        .fontWeight(.bold)
                                        .padding(.leading, -90)
                                    Text("Nếu bạn thấy gì đó không ổn, hãy lên tiếng")
                                        .multilineTextAlignment(.leading)
                                        .font(.caption)
                                    
                                }
                                .foregroundColor(.black)
                                Image(systemName: "chevron.up")
                                    .foregroundColor(.black)
                                    .rotationEffect(.degrees(90))
                                    .padding(.leading, 15)
                                Spacer()
                            }
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .modifier(ShadowModifier())
                            
                            
                        }
                        .padding(.horizontal, 15)
                        Spacer()
                        
                    }
                    .navigationBarBackButtonHidden(true)
                    .navigationBarHidden(true)
                }
                Spacer()
            }
        }
    }
}

struct GuideView_Previews: PreviewProvider {
    static var previews: some View {
        GuideView(guideActive: .constant(true), toolActive: .constant(false), rescActive: .constant(false))
    }
}
