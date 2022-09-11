//
//  MyFavouriteView.swift
//  Tinder-FE
//
//  Created by Gia Huy on 08/09/2022.
//

import SwiftUI

struct MyFavouriteView: View {
    @StateObject var signUpVMGroup = ProfileRegistrationViewModel()
    @EnvironmentObject var userViewModel: UserSignInViewModel
    @State private var disableButton: Bool = true
    var body: some View {
        ZStack {
            VStack {
                Spacer().frame(height: 50)
                HStack {
                    Text("Sở Thích")
                        .font(.system(size: 55, weight: .bold, design: .default))
                        .padding(.leading, 40)
                    Spacer()
                }
                Text("Hãy cho mọi ngươi biết bạn thích những gì bằng cách thêm sở thích vào hồ sơ")
                    .frame(width: 300)
                    .font(.system(size: 17, weight: .regular, design: .default))
                    .foregroundColor(Color("darkGrey"))
                    .padding(.bottom, 30)
                ScrollView {
                    Group {
                        HStack {
                            Button {
                                self.checkAndAddFavourite("90s")
                            } label: {
                                if !signUpVMGroup.userProfile.preferredTopic.contains("90s") {
                                    Text("90s")
                                        .modifier(ButtonOfFavoriteDisable())
                                } else {
                                    Text("90s")
                                        .modifier(ButtonOfFavoriteEnable())
                                }
                            }
                            
                            Button {
                                self.checkAndAddFavourite("Harry Potter")
                            } label: {
                                if !signUpVMGroup.userProfile.preferredTopic.contains("Harry Potter") {
                                    Text("Harry Potter")
                                        .modifier(ButtonOfFavoriteDisable())
                                } else if signUpVMGroup.userProfile.preferredTopic.contains("Harry Potter") {
                                    Text("Harry Potter")
                                        .modifier(ButtonOfFavoriteEnable())
                                }
                            }
                            Spacer()
                        }
                        HStack {
                            Button {
                                self.checkAndAddFavourite("SoundCloud")
                            } label: {
                                if !signUpVMGroup.userProfile.preferredTopic.contains("SoundCloud") {
                                    Text("SoundCloud")
                                        .modifier(ButtonOfFavoriteDisable())
                                } else if signUpVMGroup.userProfile.preferredTopic.contains("SoundCloud") {
                                    Text("SoundCloud")
                                        .modifier(ButtonOfFavoriteEnable())
                                }
                            }
                            
                            Button {
                                self.checkAndAddFavourite("Spa")
                            } label: {
                                if !signUpVMGroup.userProfile.preferredTopic.contains("Spa") {
                                    Text("Spa")
                                        .modifier(ButtonOfFavoriteDisable())
                                } else if signUpVMGroup.userProfile.preferredTopic.contains("Spa") {
                                    Text("Spa")
                                        .modifier(ButtonOfFavoriteEnable())
                                }
                            }
                            Spacer()
                        }
                        HStack {
                            Button {
                                self.checkAndAddFavourite("Chăm sóc bản thân")
                            } label: {
                                if !signUpVMGroup.userProfile.preferredTopic.contains("Chăm sóc bản thân") {
                                    Text("Chăm sóc bản thân")
                                        .modifier(ButtonOfFavoriteDisable())
                                } else if signUpVMGroup.userProfile.preferredTopic.contains("Chăm sóc bản thân") {
                                    Text("Chăm sóc bản thân")
                                        .modifier(ButtonOfFavoriteEnable())
                                }
                            }
                            
                            Button {
                                self.checkAndAddFavourite("Heavy metal")
                            } label: {
                                if !signUpVMGroup.userProfile.preferredTopic.contains("Heavy metal") {
                                    Text("Heavy metal")
                                        .modifier(ButtonOfFavoriteDisable())
                                } else {
                                    Text("Heavy metal")
                                        .modifier(ButtonOfFavoriteEnable())
                                }
                            }
                            Spacer()
                        }
                        HStack {
                            Button {
                                self.checkAndAddFavourite("Tiệc gia đình")
                            } label: {
                                if !signUpVMGroup.userProfile.preferredTopic.contains("Tiệc gia đình") {
                                    Text("Tiệc gia đình")
                                        .modifier(ButtonOfFavoriteDisable())
                                } else if signUpVMGroup.userProfile.preferredTopic.contains("Tiệc gia đình") {
                                    Text("Tiệc gia đình")
                                        .modifier(ButtonOfFavoriteEnable())
                                }
                            }
                            
                            Button {
                                self.checkAndAddFavourite("Gin Tonic")
                            } label: {
                                if !signUpVMGroup.userProfile.preferredTopic.contains("Gin Tonic") {
                                    Text("Gin Tonic")
                                        .modifier(ButtonOfFavoriteDisable())
                                } else if signUpVMGroup.userProfile.preferredTopic.contains("Gin Tonic") {
                                    Text("Gin Tonic")
                                        .modifier(ButtonOfFavoriteEnable())
                                }
                            }
                            Spacer()
                        }
                        HStack {
                            Button {
                                self.checkAndAddFavourite("Thể dục dụng cụ")
                            } label: {
                                if !signUpVMGroup.userProfile.preferredTopic.contains("Thể dục dụng cụ") {
                                    Text("Thể dục dụng cụ")
                                        .modifier(ButtonOfFavoriteDisable())
                                } else if signUpVMGroup.userProfile.preferredTopic.contains("Thể dục dụng cụ") {
                                    Text("Thể dục dụng cụ")
                                        .modifier(ButtonOfFavoriteEnable())
                                }
                            }
                            
                            Button {
                                self.checkAndAddFavourite("Hot Yoga")
                            } label: {
                                if !signUpVMGroup.userProfile.preferredTopic.contains("Hot Yoga") {
                                    Text("Hot Yoga")
                                        .modifier(ButtonOfFavoriteDisable())
                                } else if signUpVMGroup.userProfile.preferredTopic.contains("Hot Yoga") {
                                    Text("Hot Yoga")
                                        .modifier(ButtonOfFavoriteEnable())
                                }
                            }
                            
                            Button {
                                self.checkAndAddFavourite("Thiền")
                            } label: {
                                if !signUpVMGroup.userProfile.preferredTopic.contains("Thiền") {
                                    Text("Thiền")
                                        .modifier(ButtonOfFavoriteDisable())
                                } else if signUpVMGroup.userProfile.preferredTopic.contains("Thiền") {
                                    Text("Thiền")
                                        .modifier(ButtonOfFavoriteEnable())
                                }
                            }
                            Spacer()
                        }
                        HStack {
                            Button {
                                self.checkAndAddFavourite("Sushi")
                            } label: {
                                if !signUpVMGroup.userProfile.preferredTopic.contains("Sushi") {
                                    Text("Sushi")
                                        .modifier(ButtonOfFavoriteDisable())
                                } else if signUpVMGroup.userProfile.preferredTopic.contains("Sushi") {
                                    Text("Sushi")
                                        .modifier(ButtonOfFavoriteEnable())
                                }
                            }
                            
                            Button {
                                self.checkAndAddFavourite("Spotify")
                            } label: {
                                if !signUpVMGroup.userProfile.preferredTopic.contains("Spotify") {
                                    Text("Spotify")
                                        .modifier(ButtonOfFavoriteDisable())
                                } else if signUpVMGroup.userProfile.preferredTopic.contains("Spotify") {
                                    Text("Spotify")
                                        .modifier(ButtonOfFavoriteEnable())
                                }
                            }
                            
                            Button {
                                self.checkAndAddFavourite("Hockey")
                            } label: {
                                if !signUpVMGroup.userProfile.preferredTopic.contains("Hockey") {
                                    Text("Hockey")
                                        .modifier(ButtonOfFavoriteDisable())
                                } else if signUpVMGroup.userProfile.preferredTopic.contains("Hockey") {
                                    Text("Hockey")
                                        .modifier(ButtonOfFavoriteEnable())
                                }
                            }
                            
                            Spacer()
                        }
                        HStack {
                            Button {
                                self.checkAndAddFavourite("Bóng rổ")
                            } label: {
                                if !signUpVMGroup.userProfile.preferredTopic.contains("Bóng rổ") {
                                    Text("Bóng rổ")
                                        .modifier(ButtonOfFavoriteDisable())
                                } else if signUpVMGroup.userProfile.preferredTopic.contains("Bóng rổ") {
                                    Text("Bóng rổ")
                                        .modifier(ButtonOfFavoriteEnable())
                                }
                            }
                            
                            Button {
                                self.checkAndAddFavourite("Cuộc thi về thơ")
                            } label: {
                                if !signUpVMGroup.userProfile.preferredTopic.contains("Cuộc thi về thơ") {
                                    Text("Cuộc thi về thơ")
                                        .modifier(ButtonOfFavoriteDisable())
                                } else if signUpVMGroup.userProfile.preferredTopic.contains("Cuộc thi về thơ") {
                                    Text("Cuộc thi về thơ")
                                        .modifier(ButtonOfFavoriteEnable())
                                }
                            }
                            Spacer()
                        }
                        HStack {
                            Button {
                                self.checkAndAddFavourite("Tập luyện tại nhà")
                            } label: {
                                if !signUpVMGroup.userProfile.preferredTopic.contains("Tập luyện tại nhà") {
                                    Text("Tập luyện tại nhà")
                                        .modifier(ButtonOfFavoriteDisable())
                                } else if signUpVMGroup.userProfile.preferredTopic.contains("Tập luyện tại nhà") {
                                    Text("Tập luyện tại nhà")
                                        .modifier(ButtonOfFavoriteEnable())
                                }
                            }
                            
                            Button {
                                self.checkAndAddFavourite("Nhà hát")
                            } label: {
                                if !signUpVMGroup.userProfile.preferredTopic.contains("Nhà hát") {
                                    Text("Nhà hát")
                                        .modifier(ButtonOfFavoriteDisable())
                                } else if signUpVMGroup.userProfile.preferredTopic.contains("Nhà hát") {
                                    Text("Nhà hát")
                                        .modifier(ButtonOfFavoriteEnable())
                                }
                            }
                            Spacer()
                        }
                        HStack {
                            Button {
                                self.checkAndAddFavourite("Dạo quán cà phê")
                            } label: {
                                if !signUpVMGroup.userProfile.preferredTopic.contains("Dạo quán cà phê") {
                                    Text("Dạo quán cà phê")
                                        .modifier(ButtonOfFavoriteDisable())
                                } else if signUpVMGroup.userProfile.preferredTopic.contains("Dạo quán cà phê") {
                                    Text("Dạo quán cà phê")
                                        .modifier(ButtonOfFavoriteEnable())
                                }
                            }

                            Button {
                                self.checkAndAddFavourite("Bể cá")
                            } label: {
                                if !signUpVMGroup.userProfile.preferredTopic.contains("Bể cá") {
                                    Text("Bể cá")
                                        .modifier(ButtonOfFavoriteDisable())
                                } else if signUpVMGroup.userProfile.preferredTopic.contains("Bể cá") {
                                    Text("Bể cá")
                                        .modifier(ButtonOfFavoriteEnable())
                                }
                            }
                            Spacer()
                        }
                        HStack {
                            Button {
                                self.checkAndAddFavourite("Giày Sneaker")
                            } label: {
                                if !signUpVMGroup.userProfile.preferredTopic.contains("Giày Sneaker") {
                                    Text("Giày Sneaker")
                                        .modifier(ButtonOfFavoriteDisable())
                                } else if signUpVMGroup.userProfile.preferredTopic.contains("Giày Sneaker") {
                                    Text("Giày Sneaker")
                                        .modifier(ButtonOfFavoriteEnable())
                                }
                            }
                            
                            Button {
                                self.checkAndAddFavourite("Instagram")
                            } label: {
                                if !signUpVMGroup.userProfile.preferredTopic.contains("Instagram") {
                                    Text("Instagram")
                                        .modifier(ButtonOfFavoriteDisable())
                                } else if signUpVMGroup.userProfile.preferredTopic.contains("Instagram") {
                                    Text("Instagram")
                                        .modifier(ButtonOfFavoriteEnable())
                                }
                            }
                            Spacer()
                        }
                    }
                    .padding(4)
                    Group {
                        HStack {
                            Button {
                                self.checkAndAddFavourite("Suối nước nóng")
                            } label: {
                                if !signUpVMGroup.userProfile.preferredTopic.contains("Suối nước nóng") {
                                    Text("Suối nước nóng")
                                        .modifier(ButtonOfFavoriteDisable())
                                } else if signUpVMGroup.userProfile.preferredTopic.contains("Suối nước nóng") {
                                    Text("Suối nước nóng")
                                        .modifier(ButtonOfFavoriteEnable())
                                }
                            }

                            Button {
                                self.checkAndAddFavourite("Đi dạo")
                            } label: {
                                if !signUpVMGroup.userProfile.preferredTopic.contains("Đi dạo") {
                                    Text("Đi dạo")
                                        .modifier(ButtonOfFavoriteDisable())
                                } else if signUpVMGroup.userProfile.preferredTopic.contains("Đi dạo") {
                                    Text("Đi dạo")
                                        .modifier(ButtonOfFavoriteEnable())
                                }
                            }
                            
                            Button {
                                self.checkAndAddFavourite("Chạy")
                            } label: {
                                if !signUpVMGroup.userProfile.preferredTopic.contains("Chạy") {
                                    Text("Chạy")
                                        .modifier(ButtonOfFavoriteDisable())
                                } else if signUpVMGroup.userProfile.preferredTopic.contains("Chạy") {
                                    Text("Chạy")
                                        .modifier(ButtonOfFavoriteEnable())
                                }
                            }
                            Spacer()
                        }
                    }
                    .padding(4)
                }
                .padding(.leading, 10)
                Spacer()
                Button {
                    
                } label: {
                    if signUpVMGroup.userProfile.preferredTopic.count < 5 {
                        Text("TIẾP TỤC  \(signUpVMGroup.userProfile.preferredTopic.count)/5")
                            .modifier(ButtonNextDisable())
                    } else if signUpVMGroup.userProfile.preferredTopic.count == 5 {
                        Text("TIẾP TỤC  5/5")
                            .modifier(ButtonNextEnable())
                    }
                }
                .disabled(disableButton)
                .padding(.horizontal, 30)
                .onChange(of: signUpVMGroup.userProfile.preferredTopic.count, perform: {newValue in
                    if newValue == 5 {
                        self.disableButton = false
                    } else if newValue < 5 {
                        self.disableButton = true
                    }
                })
            }
            .overlay(
                Button(action: {
                    
                }) {
                  Image("darkGrayBackButton")
                        .resizable()
                        .scaledToFit()
                }
                .modifier(BackButtonModifier()),
                alignment: .topLeading
            )
            .overlay(
                Button(action: {
                    
                }) {
                  Text("BỎ QUA")
                }
                .modifier(IgnoreButton()),
                alignment: .topTrailing
            )
            .padding(.top, 20)
            .padding(.horizontal, 20)
        }
    }
    
    func checkAndAddFavourite(_ string: String) {
        print(signUpVMGroup.userProfile.preferredTopic)
        if signUpVMGroup.userProfile.preferredTopic.count < 5 {
            
            if !signUpVMGroup.userProfile.preferredTopic.contains(string) {
                self.signUpVMGroup.addTopic(topic: string)
                
            } else if signUpVMGroup.userProfile.preferredTopic.contains(string) {
                if let index = signUpVMGroup.userProfile.preferredTopic.firstIndex(of: string) {
                    self.signUpVMGroup.userProfile.preferredTopic.remove(at: index)
                }
            }
        } else if signUpVMGroup.userProfile.preferredTopic.count >= 5 {
            if !signUpVMGroup.userProfile.preferredTopic.contains(string) {
                return
            } else if signUpVMGroup.userProfile.preferredTopic.contains(string) {
                if let index = signUpVMGroup.userProfile.preferredTopic.firstIndex(of: string) {
                    self.signUpVMGroup.userProfile.preferredTopic.remove(at: index)
                }
            }
        }
    }
}

struct MyFavouriteView_Previews: PreviewProvider {
    static var previews: some View {
        MyFavouriteView()
    }
}
