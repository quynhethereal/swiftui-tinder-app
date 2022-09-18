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

// Welcome view (Terms and Conditions bla bla)
struct WelcomeView: View {
    @StateObject var welcomeVM = WelcomeViewModel()

    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color("lightPink"), Color("lightRed")]), startPoint: .leading, endPoint: .trailing)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Spacer()
                    //MARK: - LOGO
                    Image("tinderLabel")
                        .resizable()
                        .scaledToFit()
                        .frame(minWidth: 150, idealWidth: 200, maxWidth: 200, alignment: .center)
                        .padding(.vertical, 70)
                    //MARK: - LABEL
                    Text(welcomeVM.getAttributedString("By clicking GET STARTED, you agree to our Terms. Learn about how we handle your data in our Privacy Policy and Cookie Policy."))
                        .font(.system(size: 17, weight: .medium, design: .default))
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 25)
                        .padding(.bottom, 20)
                    
                 
                 
                    
                    //MARK: - BUTTON GET START
                    NavigationLink {
                        PublicView()
                    } label: {
                        Text("GET STARTED")
                            .frame(maxWidth: .infinity, minHeight: 55)
                            .tint(.white)
                            .font(.system(size: 20, weight: .medium, design: .default))
                            .overlay(
                                Capsule(style: .circular)
                                            .stroke(Color.white, style: StrokeStyle(lineWidth: 3))
                            )
                    }
                    .padding(.horizontal, 30)
                    Spacer().frame(height: 100)
                }
                .navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
