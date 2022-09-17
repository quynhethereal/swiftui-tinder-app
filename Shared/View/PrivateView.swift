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
            
            if isKeyPresentInUserDefaults(key: "userprofile") {
                ProgressView()
            } else {
                if UserDefaults.standard.bool(forKey: "userprofile") == true {
                    MainView().environmentObject(mainViewModel)
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

//struct PrivateView_Previews: PreviewProvider {
//    static var previews: some View {
//        PrivateView()
//    }
//}
