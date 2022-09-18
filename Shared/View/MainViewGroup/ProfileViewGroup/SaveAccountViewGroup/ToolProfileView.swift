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

struct ToolProfileView: View {
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
                                .foregroundColor(.black)
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
                                .foregroundColor(.gray)
                        }
                    }
                    .font(.system(size: 15, weight: .bold, design: .default))
                }
                Divider()
                NavigationView {
                    VStack {
                        NavigationLink {
                            ToolChild()
                        } label: {
                            VStack {
                                Image("toolimage1")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 300, height: 200)
                                    
                                VStack {
                                    HStack {
                                        Spacer().frame(width: 60)
                                        Text("How to report")
                                            .fontWeight(.bold)
                                            .padding(.leading, -60)
                                        Spacer()
                                    }
                                    Text("Reporting is a safe way to let us know that someone is behaving inappropriately")
                                        .multilineTextAlignment(.leading)
                                        .font(.caption)
                                    
                                }
                                .padding(.top, 15)
                                .padding(.horizontal, 40)
                                .foregroundColor(.black)
                                Spacer()
                            }
                            .frame(height: 300)
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .modifier(ShadowModifier())
                            
                            
                        }
                        .padding(.horizontal, 15)
                        .padding(.top, 40)
                        Spacer()
                    }
                    .navigationBarBackButtonHidden(true)
                    .navigationBarHidden(true)
                }
                Spacer()
            }
        }
    }
}

struct ToolProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ToolProfileView(guideActive: .constant(false), toolActive: .constant(true), rescActive: .constant(false))
    }
}
