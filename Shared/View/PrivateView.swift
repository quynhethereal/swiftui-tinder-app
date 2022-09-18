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

struct PrivateView: View {
    //@EnvironmentObject var userAuth: UserSignInViewModel
    @StateObject var userProfile = ProfileRegistrationViewModel()
    @StateObject var mainViewModel = MainViewModel()
    @StateObject var chatViewModel = ChatViewModel()
    @StateObject var conversationViewModel = ConversationViewModel()
    
    var body: some View {
        ZStack {
            
            if isKeyPresentInUserDefaults(key: "userprofile") {
                ProgressView()
            } else {
                if UserDefaults.standard.bool(forKey: "userprofile") == true {
                    MainView()
                        .environmentObject(mainViewModel)
                        .environmentObject(chatViewModel)
                        .environmentObject(conversationViewModel)
                } else {
                    InputNameView().environmentObject(userProfile)
                }
            }
        }
        .onAppear() {
            userProfile.fetchUserProfile()
        }
    }
    
    func isKeyPresentInUserDefaults(key: String) -> Bool {
        return UserDefaults.standard.object(forKey: key) == nil
    }
}
