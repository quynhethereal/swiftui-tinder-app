//
//  ContentView.swift
//  Shared
//
//  Created by Le Helen on 02/09/2022.
//

import SwiftUI
import Firebase

struct ContentView: View {
    @StateObject var userAuth: UserSignInViewModel
    
    var body: some View {
        
        if userAuth.loggedInSuccessfully {
//            HomeView()
            ProfileRegistrationView().environmentObject(userAuth)
        } else {
            SignInView().environmentObject(userAuth)
           
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
