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
 
struct ButtonSection: View {
    @EnvironmentObject var mainViewModel : MainViewModel
    var body: some View {
        HStack(spacing: 20) {
            Button(action: {
                doSwipe()
            }) {
                Image("nopeButton")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 75, height: 75)
            }
            Button(action: {
                doSwipe(rightSwipe: true)
            }) {
                Image("likeButton")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 75, height: 75)
            }
        }
        .padding(.top, 580)
        .zIndex(1.5)
        .disabled(mainViewModel.allUsers.isEmpty )
        .opacity(mainViewModel.allUsers.isEmpty ? 0.5 : 1)
    }
 
 
    func doSwipe(rightSwipe: Bool = false) {
 
        guard let first = mainViewModel.allUsers.first else {
            return
        }
 
        NotificationCenter.default.post(name: NSNotification.Name("ACTION"), object: nil, userInfo: [
            "id": first.id,
            "rightSwipe": rightSwipe
        ])
    }
}
 
struct ButtonSection_Previews: PreviewProvider {
    static var previews: some View {
        ButtonSection()
    }
}
