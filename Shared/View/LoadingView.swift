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


struct RootView: View {
    @State var isActive: Bool = true
    
    var body: some View {
        ZStack {
            if isActive {
                LoadingView(isActive: $isActive)
            } else {
                
                WelcomeView()
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

struct LoadingView: View {
    
    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    @Binding var isActive: Bool
    @State var count: Int = 3
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("lightPink"), Color("lightRed")]), startPoint: .leading, endPoint: .trailing)
                .edgesIgnoringSafeArea(.all)
            AnimationLoadingLogoView(nameAnimate: "fire")
                .frame(width: 200, height: 200, alignment: .center)
        }
        .onReceive(timer, perform: {_ in
            if count <= 1 {
                isActive = false
            } else {
                count -= 1
            }
        })
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(isActive: .constant(true))
    }
}
