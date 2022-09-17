//
//  DiscoverView.swift
//  Tinder-FE
//
//  Created by Gia Huy on 09/09/2022.
//

import SwiftUI

struct DiscoverView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Image("TinderLabelColorful")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                        .padding(.top, 25)
                    
                    NavigationLink {
                        
                    } label: {
                        VStack {
                            HStack {
                                Text("Ảnh\nĐã xác minh")
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.leading)
                                    .font(.title)
                                    .foregroundColor(.white)
                                
                                Spacer()
                            }
                            .padding()
                            Spacer()
                            HStack {
                                VStack {
                                    Text("Xác minh trên Tinder")
                                        .foregroundColor(.white)
                                    Text("Đã xác minh hình ảnh")
                                        .foregroundColor(.gray)
                                }
                                .padding()
                                Spacer()
                                Text("THỬ\nNGAY")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                    .frame(width: 100, height: 50)
                                    .background(.white)
                                    .clipShape(Capsule())
                                    .padding(.trailing, 10)
                            }
                            
                        }
                        .frame(height: 250)
                    }
                    .frame(height: 250)
                    .background(
                        Image("discoverPic1")
                            .resizable()
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.top, 10)
                    .padding(.horizontal)
                    Spacer().frame(height: 30)
                    
                    HStack {
                        Text("Chào mừng đến với thẻ khám phá")
                            .fontWeight(.semibold)
                        Spacer()
                    }
                    .padding(.leading)
                    HStack {
                        Text("Cảm hứng bây giờ của mình")
                            .foregroundColor(.gray)
                        Spacer()
                    }
                    .padding(.leading)
                    
                    HStack {

                        NavigationLink {

                        } label: {
                            VStack {
                                Spacer()
                                HStack {
                                    Text("Kiếm tìm tình yêu")
                                        .fontWeight(.bold)
                                        .font(.largeTitle)
                                        .foregroundColor(.white)
                                        .multilineTextAlignment(.leading)
                                    Spacer()
                                }
                                .padding(.leading, 10)
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
                        Spacer()
                        //MARK:  ------------------
                        NavigationLink {

                        } label: {
                            VStack {
                                HStack {
                                    Image("spotify")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 30)
                                    Text("Spotify")
                                        .font(.system(size: 20))
                                        .foregroundColor(.white)
                                    Spacer()
                                }
                                .padding(.leading, 10)
                                .padding(.top, 40)
                                HStack {
                                    Text("MUSIC\nMODE")
                                        .fontWeight(.heavy)
                                        .font(.largeTitle)
                                        .foregroundColor(.white)
                                        .multilineTextAlignment(.leading)
                                    Spacer()
                                }
                                .padding(.leading, 10)
                                Spacer()
                                Text("Tương hợp qua nhạc Spotify ưa thích")
                                    .multilineTextAlignment(.leading)
                                    .foregroundColor(.white)
                                    .padding(.leading, 5)
                                HStack {
                                    Text("Spotify")
                                        .foregroundColor(.gray)
                                    Spacer()
                                }
                                .padding(.leading, 15)
                                .padding(.bottom, 5)
                            }
                            .frame(height: 250)
                        }
                        .frame(height: 250)
                        .background(
                            Image("discoverPic2")
                                .resizable()
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 10))

                    }
                    .padding()
                    
                    
                    NavigationLink {
                        
                    } label: {
                        VStack {
                            HStack {
                                Text("Hẹn đi cafe")
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.leading)
                                    .font(.largeTitle)
                                    .foregroundColor(.white)
                                
                                Spacer()
                            }
                            .padding()
                            Spacer()
                            HStack {
                                VStack {
                                    Text("Tới quán cafe ưa thích của bạn đi")
                                        .foregroundColor(.white)
                                        .multilineTextAlignment(.leading)
                                    Text("Tìm hiểu ngay")
                                        .foregroundColor(.gray)
                                        .padding(.trailing, 100)
                                }
                                .padding()
                                Spacer()
                                Text("Tham\ngia ngay")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                    .frame(width: 100, height: 50)
                                    .background(.white)
                                    .clipShape(Capsule())
                                    .padding(.trailing, 10)
                            }
                            
                        }
                        .frame(height: 250)
                    }
                    .frame(height: 250)
                    .background(
                        Image("discoverPic4")
                            .resizable()
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.horizontal)
                    Spacer()
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
        }
    }
}

struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}
