//
//  ToolProfileView.swift
//  Tinder-FE
//
//  Created by Gia Huy on 10/09/2022.
//

import SwiftUI

struct ToolProfileView: View {
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
                                .foregroundColor(.black)
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
                        NavigationLink {
                            ToolChild()
                        } label: {
                            VStack {
                                Image("toolimage1")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 300, height: 200)
                                    
                                VStack {
                                    HStack {
                                        Spacer().frame(width: 60)
                                        Text("Cách báo cáo")
                                            .fontWeight(.bold)
                                            .padding(.leading, -60)
                                        Spacer()
                                    }
                                    Text("Báo cáo là 1 cách an toàn để báo cho chúng tôi biết rằng một người có hành xử không phu hợp")
                                        .multilineTextAlignment(.leading)
                                        .font(.caption)
                                    
                                }
                                .padding(.top, 15)
                                .padding(.horizontal, 40)
                                .foregroundColor(.black)
                                Spacer()
                            }
                            .frame(height: 300)
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .modifier(ShadowModifier())
                            
                            
                        }
                        .padding(.horizontal, 15)
                        .padding(.top, 40)
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

struct ToolProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ToolProfileView(guideActive: .constant(false), toolActive: .constant(true), rescActive: .constant(false))
    }
}
