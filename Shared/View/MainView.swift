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
