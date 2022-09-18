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
