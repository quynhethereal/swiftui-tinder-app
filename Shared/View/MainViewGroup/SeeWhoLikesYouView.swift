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

struct SeeWhoLikesYouView: View {
    @State var isGoToWhoLikeYouView: Bool = true
    var body: some View {
        ZStack {
            if isGoToWhoLikeYouView {
                WhoLikeYou(active: $isGoToWhoLikeYouView)
            } else {
                TopLikeView(active: $isGoToWhoLikeYouView)
            }
        }
    }
}

struct WhoLikeYou: View {
    @Binding var active: Bool
    var whoLikeYou: [[String]] = [
        ["gin", "Có hoạt động gần đây"],
        ["vodka", "Rời mạng"],
        ["rum", "Có hoạt động gần đây"],
        ["tequila", "Rời mạng"],
    ]
    var body: some View {
        ZStack {
            VStack {
                Image("TinderLabelColorful")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                    .padding(.top, 25)
                HStack {
                    Spacer()
                    Button {
                        self.active = true
                    } label: {
                        Text("\(whoLikeYou.count) Likes")
                            .font(.system(size: 20, weight: .heavy, design: .default))
                            .foregroundColor(.black)
                    }
                    .padding(.horizontal, 20)
                    Spacer()
                    Divider().frame(height: 40)
                    Spacer()
                    Button {
                        self.active = false
                    } label: {
                        Text("Top Collection")
                            .font(.system(size: 20, weight: .heavy, design: .default))
                            .foregroundColor(.gray)
                    }
                    .padding(.horizontal, 5)
                    Spacer()
                }
                .padding(25)
                ScrollView {
                    VStack {
                        ForEach(whoLikeYou, id: \.self) { user in
                            HStack {
                                
                                NavigationLink {
                                    
                                } label: {
                                    VStack {
                                        Spacer()
                                        HStack {
                                            Text(user[1])
                                                .fontWeight(.bold)
                                                .foregroundColor(.white)
                                            Spacer()
                                        }
                                        .padding(.leading, 10)
                                        .padding(.bottom, 5)
                                    }
                                    .frame(height: 250)
                                }
                                .frame(height: 250)
                                .background(
                                    Image(user[0])
                                        .resizable()
                                )
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                Spacer()
                                NavigationLink {
                                    
                                } label: {
                                    VStack {
                                        Spacer()
                                        Text("Khiến tim loạn nhịp từ cái nhìn đầu tiên")
                                            .multilineTextAlignment(.leading)
                                            .foregroundColor(.white)
                                            .padding(.leading, 5)
                                        HStack {
                                            Text("Tìm hiểu thêm")
                                                .foregroundColor(.gray)
                                            Spacer()
                                        }
                                        .padding(.leading, 10)
                                        .padding(.bottom, 5)
                                    }
                                    .frame(height: 250)
                                }
                                .frame(height: 250)
                                .background(
                                    Image("discoverPic3")
                                        .resizable()
                                )
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                
                                
                            }
                            .padding()
                        }
                    }
                }
                Spacer()
            }
        }
    }
}

struct TopLikeView: View {
    @Binding var active: Bool
    var whoLikeYou: [[String]] = [
        ["gin", "Có hoạt động gần đây"],
        ["vodka", "Rời mạng"],
        ["rum", "Có hoạt động gần đây"],
        ["tequila", "Rời mạng"],
    ]
    var body: some View {
        ZStack {
            VStack {
                Image("TinderLabelColorful")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                    .padding(.top, 25)
                HStack {
                    Spacer()
                    Button {
                        self.active = true
                    } label: {
                        Text("Likes")
                            .font(.system(size: 20, weight: .heavy, design: .default))
                            .foregroundColor(.gray)
                    }
                    .padding(.horizontal, 20)
                    Spacer()
                    Divider().frame(height: 40)
                    Spacer()
                    Button {
                        self.active = false
                    } label: {
                        Text("Top Collection")
                            .font(.system(size: 20, weight: .heavy, design: .default))
                            .foregroundColor(.black)
                    }
                    .padding(.horizontal, 5)
                    Spacer()
                }
                .padding(25)
                ScrollView {
                    VStack {
                        ForEach(whoLikeYou, id: \.self) { user in
                            HStack {
                                
                                NavigationLink {
                                    
                                } label: {
                                    VStack {
                                        Spacer()
                                        HStack {
                                            Text(user[1])
                                                .fontWeight(.bold)
                                                .foregroundColor(.white)
                                            Spacer()
                                        }
                                        .padding(.leading, 10)
                                        .padding(.bottom, 5)
                                    }
                                    .frame(height: 250)
                                }
                                .frame(height: 250)
                                .background(
                                    Image(user[0])
                                        .resizable()
                                )
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                Spacer()
                                NavigationLink {
                                    
                                } label: {
                                    VStack {
                                        Spacer()
                                        Text("Make your heart beat hard")
                                            .multilineTextAlignment(.leading)
                                            .foregroundColor(.white)
                                            .padding(.leading, 5)
                                        HStack {
                                            Text("See more")
                                                .foregroundColor(.gray)
                                            Spacer()
                                        }
                                        .padding(.leading, 10)
                                        .padding(.bottom, 5)
                                    }
                                    .frame(height: 250)
                                }
                                .frame(height: 250)
                                .background(
                                    Image("discoverPic3")
                                        .resizable()
                                )
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                
                                
                            }
                            .padding()
                        }
                    }
                }
                Spacer()
            }
        }
    }
}


struct SeeWhoLikesYouView_Previews: PreviewProvider {
    static var previews: some View {
        WhoLikeYou(active: .constant(true))
        TopLikeView(active: .constant(true))
    }
}
