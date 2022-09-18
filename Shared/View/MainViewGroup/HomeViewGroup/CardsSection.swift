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

struct CardsSection: View {
    @EnvironmentObject var mainViewModel : MainViewModel
    var body: some View {
        ZStack{
            if mainViewModel.allUsers.isEmpty {
                Text("No Matching User")
                    .multilineTextAlignment(.center)
            } else {
                ForEach(mainViewModel.allUsers.reversed()) { matcher in
                    CardView(matcher: matcher)
                        .environmentObject(mainViewModel)
                }
            }
        }
        .padding(10)
        .zIndex(1.0)
    }
}

struct CardsSection_Previews: PreviewProvider {
    static var previews: some View {
        CardsSection()
    }
}
