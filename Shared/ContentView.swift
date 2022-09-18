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
        // if there is a user defaults value for user login, don't ask the user to login again
        if UserDefaults.standard.bool(forKey: "userlogin") {
            PrivateView(userProfile: userProfile)
        // else, ask them to login in or sign up
        } else {
            RootView().environmentObject(userAuth)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    
    static let userAuth = UserSignInViewModel()
    
    static var previews: some View {
        
        ContentView(userAuth: userAuth)
    }
}
