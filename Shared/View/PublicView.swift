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

struct PublicView: View {
    @EnvironmentObject var userAuth: UserSignInViewModel
    @State var isActive: Bool = true
    var body: some View {
        ZStack {
            
            if isActive {
                SignInView(isActive: $isActive).environmentObject(userAuth)
            } else {
                SignUpView(isActive: $isActive)
            }
        }
    }
}

struct PublicView_Previews: PreviewProvider {
    static let userAuth = UserSignInViewModel()
    static var previews: some View {
        PublicView().environmentObject(userAuth)
    }
}
