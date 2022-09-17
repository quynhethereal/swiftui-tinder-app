//
//  ContentView.swift
//  Shared
//
//  Created by Le Helen on 02/09/2022.
//

import SwiftUI
import Firebase
import FirebaseAuthCombineSwift


struct ContentView: View {
    @StateObject var userAuth: UserSignInViewModel
    @StateObject var userProfile = ProfileRegistrationViewModel()
    
    var body: some View {
        
        
        if UserDefaults.standard.bool(forKey: "userlogin") {
//            HomeView()
//            ProfileRegistrationView().environmentObject(userAuth)
//            AddImageView()
            PrivateView(userProfile: userProfile)
//                .environmentObject(userProfile)
            
        } else {
//            SignInView().environmentObject(userAuth)
//            AddImageView()
//            MyFavouriteView().environmentObject(userAuth)
//            SignInView().environmentObject(userAuth)
//            PublicView().environmentObject(userAuth)
            RootView().environmentObject(userAuth)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    
    static let userAuth = UserSignInViewModel()
    
    static var previews: some View {
        
//        ContentView().environmentObject({
//            () -> UserSignInViewModel in
//            let userAuth = UserSignInViewModel()
//            userAuth.loggedInSuccessfully = false
//            return userAuth
//        }() )
        
        ContentView(userAuth: userAuth)
    }
}
