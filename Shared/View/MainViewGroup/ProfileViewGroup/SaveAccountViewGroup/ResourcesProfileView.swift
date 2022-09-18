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

struct ResourcesProfileView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var guideActive: Bool
    @Binding var toolActive: Bool
    @Binding var rescActive: Bool
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer().frame(width: 20)
                    Button {
                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "multiply")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 20)
                            .foregroundColor(.black)
                    }
                    Spacer().frame(width: 45)
                    Text("Safety Center")
                        .font(.system(size: 26, weight: .bold, design: .default))
                        .foregroundColor(Color.black)
                    Spacer()
                }
                .padding()
                
                HStack {
                    Group {
                        Button {
                            guideActive = true
                            toolActive = false
                            rescActive = false
                        } label: {
                            Text("Guide")
                                .foregroundColor(.gray)
                                .padding()
                        }
                        Divider().frame(height: 30)
                        Button {
                            guideActive = false
                            toolActive = true
                            rescActive = false
                        } label: {
                            Text("Tool")
                                .foregroundColor(.gray)
                                .padding()
                        }
                        Divider().frame(height: 30)
                        Button {
                            guideActive = false
                            toolActive = false
                            rescActive = true
                        } label: {
                            Text("Resource")
                                .padding()
                                .foregroundColor(.black)
                        }
                    }
                    .font(.system(size: 15, weight: .bold, design: .default))
                }
                Divider()
                HStack {
                    Text("Reference source")
                        .fontWeight(.bold)
                        .padding(.top, 5)
                        .padding(.leading, 50)
                    Spacer()
                }
                HStack {
                    Button {
                        if let url = URL(string: "https://mtch.com/safety#user_education") {
                                UIApplication.shared.open(url, options: [:], completionHandler: nil)
                        }
                    } label: {
                        Text("Visit website")
                            .foregroundColor(.black)
                            .modifier(ButtonOfFavoriteDisable())
                    }
                    .padding(.leading, 50)
                    Spacer()
                }
                Spacer()
            }
        }
    }
}

struct ResourcesProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ResourcesProfileView(guideActive: .constant(false), toolActive: .constant(false), rescActive: .constant(true))
    }
}
