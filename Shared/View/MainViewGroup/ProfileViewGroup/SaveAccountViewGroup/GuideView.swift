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

struct GuideView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var mainViewModel : MainViewModel
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
                                .foregroundColor(.black)
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
                                .foregroundColor(.gray)
                        }
                    }
                    .font(.system(size: 15, weight: .bold, design: .default))
                }
                Divider()
                NavigationView {
                    VStack {
                        HStack {
                            VStack {
                                Text("Hello \(mainViewModel.userProfile.name)")
                                    .font(.system(size: 40, weight: .bold, design: .default))
                                    .offset(x: -20)
                                Text("Here's everything you need to know about safety")
                                    .foregroundColor(.gray)
                            }
                            Spacer()

                            AsyncImage(url: URL(string: mainViewModel.userProfile.images[0])) { phase in
                                
                                switch phase {
                                case .empty:
                                    HStack{
                                        Spacer()
                                        ProgressView()
                                        Spacer()
                                    }.scaledToFill()
                                        .frame(width: 40, height: 40)
                                        .clipShape(Circle())
                                case .success(let image):
                                    image
                                        .resizable()
                                        .frame(width: 60, height: 60)
                                        .clipShape(Circle())
                                        .offset(x: 5)
                                    
                                case .failure:
                                    
                                    //Call the AsynchImage 2nd time - when there is a failure. (I think you can also check NSURLErrorCancelled = -999)
                                    AsyncImage(url: URL(string: mainViewModel.userProfile.images[0])) { phase in
                                        if let image = phase.image {
                                            image
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 40, height: 40)
                                                .clipShape(Circle())
                                        } else{

                                            HStack{
                                                Spacer()
                                                ProgressView()
                                                Spacer()
                                            }
                                        }
                                    }.frame(width: 100,height: 150)
                                @unknown default:

                                    HStack{
                                        Spacer()
                                        ProgressView()
                                        Spacer()
                                    }
                                    
                                }
                            }

                            Spacer()
                        }
                        .padding()
                        Text("Safe")
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading)
                        NavigationLink {
                            GuideChild1()
                        } label: {
                            HStack {
                                Image("saveProfile2")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 110)
                                    
                                VStack {
                                    Text("Basic Informtation")
                                        .fontWeight(.bold)
                                        .padding(.leading, -60)
                                    Text("Everything you need to know to be safer on Matches and in real life - all in one place")
                                        .multilineTextAlignment(.leading)
                                        .font(.caption)
                                    
                                }
                                .foregroundColor(.black)
                                Image(systemName: "chevron.up")
                                    .foregroundColor(.black)
                                    .rotationEffect(.degrees(90))
                                Spacer()
                            }
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .modifier(ShadowModifier())
                            
                            
                        }
                        .padding(.horizontal, 15)
                        Spacer().frame(height: 50)
                        Text("Trouble")
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading)
                        NavigationLink {
                            GuideChild2()
                        } label: {
                            HStack {
                                Image("saveProfile3")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 110)
                                VStack {
                                    Text("Treatment")
                                        .fontWeight(.bold)
                                        .padding(.leading, -90)
                                    Text("If you see something wrong, speak up")
                                        .multilineTextAlignment(.leading)
                                        .font(.caption)
                                    
                                }
                                .foregroundColor(.black)
                                Image(systemName: "chevron.up")
                                    .foregroundColor(.black)
                                    .rotationEffect(.degrees(90))
                                    .padding(.leading, 15)
                                Spacer()
                            }
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .modifier(ShadowModifier())
                            
                            
                        }
                        .padding(.horizontal, 15)
                        Spacer()
                        
                    }
                    .navigationBarBackButtonHidden(true)
                    .navigationBarHidden(true)
                }
                Spacer()
            }
        }
    }
    
    @ViewBuilder
    private func view(for phase: AsyncImagePhase) -> some View {
        switch phase {
        case .empty:
                HStack{
                    Spacer()
                    ProgressView()
                    Spacer()
                }
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            
        case .success(let image):
            image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
        case .failure(let error):
            VStack(spacing: 16) {
                Image(systemName: "xmark.octagon.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                    .foregroundColor(.red)
                Text(error.localizedDescription)
                    .multilineTextAlignment(.center)
            }
        @unknown default:
            Text("Unknown")
                .foregroundColor(.gray)
        }
    }
}

struct GuideView_Previews: PreviewProvider {
    static var previews: some View {
        GuideView(guideActive: .constant(true), toolActive: .constant(false), rescActive: .constant(false))
    }
}
