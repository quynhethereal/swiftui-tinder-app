//
//  MyFavouriteView.swift
//  Tinder-FE
//
//  Created by Gia Huy on 08/09/2022.
//

import SwiftUI

struct MyFavouriteView: View {
    @EnvironmentObject var signUpVMGroup: ProfileRegistrationViewModel
    @EnvironmentObject var userViewModel: UserSignInViewModel
    @State private var disableButton: Bool = true
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var selection: Int? = nil
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Spacer().frame(height: 50)
                    HStack {
                        Text("Favorite")
                            .font(.system(size: 55, weight: .bold, design: .default))
                            .padding(.leading, 40)
                        Spacer()
                    }
                    Text("Let everyone know what you like by adding interests to your profile")
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
                                    self.checkAndAddFavourite("Self Care")
                                } label: {
                                    if !signUpVMGroup.userProfile.preferredTopic.contains("Self Care") {
                                        Text("Self Care")
                                            .modifier(ButtonOfFavoriteDisable())
                                    } else if signUpVMGroup.userProfile.preferredTopic.contains("Self Care") {
                                        Text("Self Care")
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
                                    self.checkAndAddFavourite("Family Party")
                                } label: {
                                    if !signUpVMGroup.userProfile.preferredTopic.contains("Family Party") {
                                        Text("Family Party")
                                            .modifier(ButtonOfFavoriteDisable())
                                    } else if signUpVMGroup.userProfile.preferredTopic.contains("Family Party") {
                                        Text("Family Party")
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
                                    self.checkAndAddFavourite("Gymnastics")
                                } label: {
                                    if !signUpVMGroup.userProfile.preferredTopic.contains("Gymnastics") {
                                        Text("Gymnastics")
                                            .modifier(ButtonOfFavoriteDisable())
                                    } else if signUpVMGroup.userProfile.preferredTopic.contains("Gymnastics") {
                                        Text("Gymnastics")
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
                                    self.checkAndAddFavourite("Meditation")
                                } label: {
                                    if !signUpVMGroup.userProfile.preferredTopic.contains("Meditation") {
                                        Text("Meditation")
                                            .modifier(ButtonOfFavoriteDisable())
                                    } else if signUpVMGroup.userProfile.preferredTopic.contains("Meditation") {
                                        Text("Meditation")
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
                                    self.checkAndAddFavourite("Basketball")
                                } label: {
                                    if !signUpVMGroup.userProfile.preferredTopic.contains("Basketball") {
                                        Text("Basketball")
                                            .modifier(ButtonOfFavoriteDisable())
                                    } else if signUpVMGroup.userProfile.preferredTopic.contains("Basketball") {
                                        Text("Basketball")
                                            .modifier(ButtonOfFavoriteEnable())
                                    }
                                }
                                
                                Button {
                                    self.checkAndAddFavourite("Poetry Contest")
                                } label: {
                                    if !signUpVMGroup.userProfile.preferredTopic.contains("Poetry Contest") {
                                        Text("Poetry Contest")
                                            .modifier(ButtonOfFavoriteDisable())
                                    } else if signUpVMGroup.userProfile.preferredTopic.contains("Poetry Contest") {
                                        Text("Poetry Contest")
                                            .modifier(ButtonOfFavoriteEnable())
                                    }
                                }
                                Spacer()
                            }
                            HStack {
                                Button {
                                    self.checkAndAddFavourite("Workout at home")
                                } label: {
                                    if !signUpVMGroup.userProfile.preferredTopic.contains("Workout at home") {
                                        Text("Workout at home")
                                            .modifier(ButtonOfFavoriteDisable())
                                    } else if signUpVMGroup.userProfile.preferredTopic.contains("Workout at home") {
                                        Text("Workout at home")
                                            .modifier(ButtonOfFavoriteEnable())
                                    }
                                }
                                
                                Button {
                                    self.checkAndAddFavourite("Theatre")
                                } label: {
                                    if !signUpVMGroup.userProfile.preferredTopic.contains("Theatre") {
                                        Text("Theatre")
                                            .modifier(ButtonOfFavoriteDisable())
                                    } else if signUpVMGroup.userProfile.preferredTopic.contains("Theatre") {
                                        Text("Theatre")
                                            .modifier(ButtonOfFavoriteEnable())
                                    }
                                }
                                Spacer()
                            }
                            HStack {
                                Button {
                                    self.checkAndAddFavourite("The coffee shop")
                                } label: {
                                    if !signUpVMGroup.userProfile.preferredTopic.contains("The coffee shop") {
                                        Text("The coffee shop")
                                            .modifier(ButtonOfFavoriteDisable())
                                    } else if signUpVMGroup.userProfile.preferredTopic.contains("The coffee shop") {
                                        Text("The coffee shop")
                                            .modifier(ButtonOfFavoriteEnable())
                                    }
                                }

                                Button {
                                    self.checkAndAddFavourite("Aquarium")
                                } label: {
                                    if !signUpVMGroup.userProfile.preferredTopic.contains("Aquarium") {
                                        Text("Aquarium")
                                            .modifier(ButtonOfFavoriteDisable())
                                    } else if signUpVMGroup.userProfile.preferredTopic.contains("Aquarium") {
                                        Text("Aquarium")
                                            .modifier(ButtonOfFavoriteEnable())
                                    }
                                }
                                Spacer()
                            }
                            HStack {
                                Button {
                                    self.checkAndAddFavourite("Sneaker")
                                } label: {
                                    if !signUpVMGroup.userProfile.preferredTopic.contains("Sneaker") {
                                        Text("Sneaker")
                                            .modifier(ButtonOfFavoriteDisable())
                                    } else if signUpVMGroup.userProfile.preferredTopic.contains("Sneaker") {
                                        Text("Sneaker")
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
                                    self.checkAndAddFavourite("Hot springs")
                                } label: {
                                    if !signUpVMGroup.userProfile.preferredTopic.contains("Hot springs") {
                                        Text("Hot springs")
                                            .modifier(ButtonOfFavoriteDisable())
                                    } else if signUpVMGroup.userProfile.preferredTopic.contains("Hot springs") {
                                        Text("Hot springs")
                                            .modifier(ButtonOfFavoriteEnable())
                                    }
                                }

                                Button {
                                    self.checkAndAddFavourite("Walking")
                                } label: {
                                    if !signUpVMGroup.userProfile.preferredTopic.contains("Walking") {
                                        Text("Walking")
                                            .modifier(ButtonOfFavoriteDisable())
                                    } else if signUpVMGroup.userProfile.preferredTopic.contains("Walking") {
                                        Text("Walking")
                                            .modifier(ButtonOfFavoriteEnable())
                                    }
                                }
                                
                                Button {
                                    self.checkAndAddFavourite("Running")
                                } label: {
                                    if !signUpVMGroup.userProfile.preferredTopic.contains("Running") {
                                        Text("Running")
                                            .modifier(ButtonOfFavoriteDisable())
                                    } else if signUpVMGroup.userProfile.preferredTopic.contains("Running") {
                                        Text("Running")
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
                    NavigationLink(destination: AddImageView(), tag: 1,selection: $selection) {
                        Button {
                            self.selection = 1
                        } label: {
                            if signUpVMGroup.userProfile.preferredTopic.count < 5 {
                                Text("NEXT  \(signUpVMGroup.userProfile.preferredTopic.count)/5")
                                    .modifier(ButtonNextDisable())
                            } else if signUpVMGroup.userProfile.preferredTopic.count == 5 {
                                Text("NEXT 5/5")
                                    .modifier(ButtonNextEnable())
                            }
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
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                      Image("darkGrayBackButton")
                            .resizable()
                            .scaledToFit()
                    }
                    .modifier(BackButtonModifier()),
                    alignment: .topLeading
                )
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        
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
