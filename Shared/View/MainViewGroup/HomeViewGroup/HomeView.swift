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

struct HomeView: View {
    @EnvironmentObject var mainViewModel : MainViewModel
    var body: some View {
        ZStack {
            VStack {
                Image("TinderLabelColorful")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                    .padding(.top, 25)
                ZStack {
                    CardsSection().environmentObject(mainViewModel)
                    ButtonSection().environmentObject(mainViewModel)
                }
                Spacer()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        
        HomeView()
    }
}
