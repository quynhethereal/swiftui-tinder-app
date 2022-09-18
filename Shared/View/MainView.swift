//
//  HomeView.swift
//  TinderApp
//
//  Created by Le Helen on 02/09/2022.
//

import SwiftUI

struct MainView: View {
    @State var selectedTab: Int = 0
    @EnvironmentObject var mainViewModel : MainViewModel
    @EnvironmentObject var chatViewModel : ChatViewModel
    @EnvironmentObject var conversationViewModel : ConversationViewModel
    var body: some View {
        TabView(selection: $selectedTab) {
            
            HomeView().environmentObject(mainViewModel)
                .tabItem {
                    if selectedTab == 0 {
                        Image("TinderIconColorful")
                    } else {
                        Image("TinderIconDisable")
                    }
                }
                .tag(0)
            
            DiscoverView()
                .tabItem {
                    if selectedTab == 1 {
                        Image("discoverEnable")
                    } else {
                        Image("discoverDisable")
                    }
                }
                .tag(1)
            
            SeeWhoLikesYouView()
                .tabItem {
                    if selectedTab == 2 {
                        Image("tinderGoldEnable")
                    } else {
                        Image("tinderGoldDisable")
                    }
                }
                .tag(2)
            
            ChatView()
                .environmentObject(chatViewModel)
                .environmentObject(conversationViewModel)
                .tabItem {
                    if selectedTab == 3 {
                        Image("chatEnable")
                    } else {
                        Image("chatDisable")
                    }
                }
                .tag(3)
            
            ProfileView().environmentObject(mainViewModel)
                .tabItem {
                    if selectedTab == 4 {
                        Image("profileEnable")
                    } else {
                        Image("profileDisable")
                    }
                }
                .tag(4)
        }
        .onAppear() {
//            mainViewModel.getLoginUser()
            chatViewModel.getAllMatchesProfiles()

        }
        .task{
            // do not change the order as they are supposed to be synchronous
            await mainViewModel.getLoginUser()
            await mainViewModel.getAllUser()
//            await conversationViewModel.fetchData()
            
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
