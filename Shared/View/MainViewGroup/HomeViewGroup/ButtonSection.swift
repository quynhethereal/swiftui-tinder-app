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
        HStack(spacing: 15) {
            Button(action: {
                
            }) {
                Image("resetButton")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 55, height: 55)
            }
            Button(action: {}) {
                Image("nopeButton")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 75, height: 75)
            }
            Button(action: {}) {
                Image("supperLikeButton")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 55, height: 55)
            }
            Button(action: {}) {
                Image("likeButton")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 75, height: 75)
            }
            Button(action: {}) {
                Image("boostButton")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 55, height: 55)
            }
        }
        .padding(.top, 580)
        .zIndex(1.5)
    }
    
}

struct ButtonSection_Previews: PreviewProvider {
    static var previews: some View {
        ButtonSection()
    }
}
