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

struct ChatView: View {
    @EnvironmentObject var chatViewModel : ChatViewModel
    @EnvironmentObject var conversationViewModel : ConversationViewModel
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
                        //Image match
                        ForEach(chatViewModel.allMatches, id: \.self) { matcher in
                            NavigationLink {
                                
                            } label: {
                                VStack {
//                                    Image(matcher.images)
//                                        .resizable()
                                    AsyncImage(url: URL(string: matcher.images[0]), content: view)
                                }
                                .frame(width: 100,height: 150)
                            }
                            .frame(width: 100,height: 150)
                            .clipShape(RoundedRectangle(cornerRadius: 10))

                        }
                        //Image match
                    }
                    .padding(.horizontal)
                }
                Spacer().frame(height: 15)
                HStack {
                    Text("Assistant")
                        .fontWeight(.bold)
                        .foregroundColor(Color("lightRed"))
                        .padding()
                    Spacer()
                }
                .offset(y: 15)
                NavigationLink {
                    ChatBotViewScreen(imgName: "tinderBot", name: "Love Witcher", online: "true")
                } label: {
                    ChatViewRow(imgName: "tinderBot", name: "Love Witcher", lastMessage: "Love Witcher is always here for you", online: "true")
                }

                Spacer()
                HStack {
                    Text("Message")
                        .fontWeight(.bold)
                        .foregroundColor(Color("lightRed"))
                        .padding()
                    Spacer()
                }
//                ScrollView {
//                    
//                    ForEach(conversationViewModel.conversations, id: \.self) { con in
//                        ForEach(chatViewModel.allMatches, id:\.self) { user in
//                            
//                            if con.participants[0] == user.id {
//                                NavigationLink {
//                                    //ChatViewScreen(imgName: user[0], name: user[1], online: user[3])
//                                } label: {
//                                    ChatViewRow(matcher: user)
//                                }
//                            } else if con.participants[1] == user.id {
//                                NavigationLink {
//                                    //ChatViewScreen(imgName: user[0], name: user[1], online: user[3])
//                                } label: {
//                                    ChatViewRow(matcher: user)
//                                }
//                            }
//                        }
//
//
//                    }
//                }
                ScrollView{
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
        .onAppear() {
            chatViewModel.getAllMatchesProfiles()
//            conversationViewModel.fetchData()
        }
//        .task {
//            await conversationViewModel.fetchData()
//        }
    }
        
        
    
    @ViewBuilder
    private func view(for phase: AsyncImagePhase) -> some View {
        switch phase {
        case .empty:
                HStack{
                    Spacer()
                    ProgressView()
                    Spacer()
                }
            
        case .success(let image):
            image
                .resizable()
                .frame(width: 100,height: 150)
                
        case .failure(let error):
            VStack(spacing: 16) {
                Image(systemName: "xmark.octagon.fill")
                    .resizable()
                    
                    
                Text(error.localizedDescription)
                    .multilineTextAlignment(.center)
            }
            .frame(width: 100,height: 150)
        @unknown default:
            Text("Unknown")
                .foregroundColor(.gray)
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
