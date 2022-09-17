//
//  PrivateView.swift
//  TinderApp
//
//  Created by Dat Duong on 12/09/2022.
//

import SwiftUI

struct PrivateView: View {
    //@EnvironmentObject var userAuth: UserSignInViewModel
    @StateObject var userProfile = ProfileRegistrationViewModel()
    @StateObject var mainViewModel = MainViewModel()
    
    var body: some View {
        ZStack {
            if UserDefaults.standard.bool(forKey: "userprofile") {
                MainView().environmentObject(mainViewModel)
            } else {
                InputNameView().environmentObject(userProfile)
            }
        }
        .onAppear() {
            userProfile.fetchUserProfile()
        }
    }
}

//struct PrivateView_Previews: PreviewProvider {
//    static var previews: some View {
//        PrivateView()
//    }
//}
