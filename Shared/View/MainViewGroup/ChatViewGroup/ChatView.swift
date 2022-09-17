//
//  ChatView.swift
//  Tinder-FE
//
//  Created by Gia Huy on 09/09/2022.
//

import SwiftUI

struct ChatView: View {
    let demoImageArray = ["rum", "vodka", "chianti", "gin", "tequila"]
    let listOfCurrentMess: [[String]] = [
        ["rum", "Rum", "I love you...", "false"],
        ["vodka", "Vodka", "Đi đấm nhau với gấu đê..", "true"],
        ["gin", "Gin", "tối nay ăn gì", "true"],
    ]
    @State private var showingSaveProfileView = false
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Spacer()
                    Image("TinderLabelColorful")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                        .offset(x: 25)
                        .padding(.top, 18)
                    Spacer()
                    Button {
                        self.showingSaveProfileView = true
                    } label: {
                        Image(systemName: "shield.fill")
                            .resizable()
                            .foregroundColor(.gray)
                            .scaledToFit()
                            .frame(width: 30)
                            .padding(.top, 15)
                            .padding(.trailing, 20)
                    }
                }
                .padding(.bottom, 30)
                HStack {
                    Text("New Match")
                        .fontWeight(.bold)
                        .foregroundColor(Color("lightRed"))
                        .padding()
                    Spacer()
                }
                ScrollView(.horizontal) {
                    HStack(spacing: 10) {
                        ForEach(demoImageArray, id: \.self) { img in
                            NavigationLink {
                                
                            } label: {
                                VStack {
                                    Image(img)
                                        .resizable()
                                }
                                .frame(width: 100,height: 150)
                            }
                            .frame(width: 100,height: 150)
                            .clipShape(RoundedRectangle(cornerRadius: 10))

                        }
                    }
                    .padding(.horizontal)
                }
                Spacer().frame(height: 15)
                HStack {
                    Text("Trợ lý")
                        .fontWeight(.bold)
                        .foregroundColor(Color("lightRed"))
                        .padding()
                    Spacer()
                }
                .offset(y: 15)
                NavigationLink {
                    ChatBotViewScreen(imgName: "tinderBot", name: "Phù thuỷ tình iu", online: "true")
                } label: {
                    ChatViewRow(imgName: "tinderBot", name: "Phù thuỷ tình iu", lastMessage: "Tui là phù thuỷ tình yêu đây", online: "true")
                }

                Spacer()
                HStack {
                    Text("Message")
                        .fontWeight(.bold)
                        .foregroundColor(Color("lightRed"))
                        .padding()
                    Spacer()
                }
                ScrollView {
                    ForEach(listOfCurrentMess, id: \.self) { user in
                        NavigationLink {
                            ChatViewScreen(imgName: user[0], name: user[1], online: user[3])
                        } label: {
                            ChatViewRow(imgName: user[0], name: user[1], lastMessage: user[2], online: user[3])
                        }

                    }
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
            .sheet(isPresented: $showingSaveProfileView) {
//                SaveAccountCenterView()
            }
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
