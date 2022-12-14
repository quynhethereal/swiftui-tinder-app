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

// View to display dumb quotes
struct ProfileView: View {
    @State private var showingSettingView = false
    @State private var showingEditProfileView = false
    @State private var showingSaveProfileView = false
    @EnvironmentObject var mainViewModel : MainViewModel
    private let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    @State private var currentIndex = 0
    @State private var adds = [
        "In love there are two things– bodies and words",
        "Love makes your soul crawl out from its hiding place",
        "Where there is love there is life",
        "Whatever our souls are made of, his and mine are the same",
        "There is always madness in love. But there is also always some reason in madness"
    ]
    var body: some View {
        ZStack {
            Color("lightGrey").ignoresSafeArea()
            VStack {
                VStack {
                    Image("TinderLabelColorful")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                        .padding(.top, 22)
                        .zIndex(1.0)
                    Spacer().frame(height: 20)
                    AsyncImage(url: URL(string: mainViewModel.userProfile.images[0])) { phase in
                        
                        switch phase {
                        case .empty:
                            HStack{
                                Spacer()
                                ProgressView()
                                Spacer()
                            }.frame(width: 200, height: 200)
                                .clipShape(Circle())
                                .background(
                                    Circle().fill(Color.white).scaleEffect(3)
                                )
                        case .success(let image):
                            image
                                .frame(width: 200, height: 200)
                                .clipShape(Circle())
                                .background(
                                    Circle().fill(Color.white).scaleEffect(3)
                                )
                            
                        case .failure:
                            
                            //Call the AsynchImage 2nd time - when there is a failure.
                            AsyncImage(url: URL(string: mainViewModel.userProfile.images[0])) { phase in
                                if let image = phase.image {
                                    image
                                        .frame(width: 200, height: 200)
                                        .clipShape(Circle())
                                        .background(
                                            Circle().fill(Color.white).scaleEffect(3)
                                        )
                                } else{

                                    HStack{
                                        Spacer()
                                        ProgressView()
                                        Spacer()
                                    }
                                }
                            }
                        @unknown default:

                            HStack{
                                Spacer()
                                ProgressView()
                                Spacer()
                            }
                            
                        }
                    }
                    HStack {
                        
                        Text("\(mainViewModel.userProfile.name), \(mainViewModel.userProfile.ageFromDB)")

                            .font(.title2)
                            .fontWeight(.bold)
                        Image(systemName: "checkmark.seal.fill")
                            .foregroundColor(.blue)
                    }
                    Spacer().frame(height: 30)
                    HStack {
                        Button {
                            showingSettingView = true
                        } label: {
                            Image(systemName: "gearshape.fill")
                                    .foregroundColor(Color("darkGrey"))
                                    .padding()
                                    .background(.white)
                                    .clipShape(Circle())
                                    .modifier(ShadowModifier())
                        }
                        Spacer()
                        Button {
                            showingSaveProfileView = true
                        } label: {
                            Image(systemName: "shield.fill")
                                    .foregroundColor(Color("darkGrey"))
                                    .padding()
                                    .background(.white)
                                    .clipShape(Circle())
                                    .modifier(ShadowModifier())
                        }
                    }
                    .padding(.horizontal, 80)
                    Button {
                        showingEditProfileView = true
                    } label: {
                        Image(systemName: "pencil")
                                .foregroundColor(Color("darkGrey"))
                                .font(.largeTitle)
                                .padding()
                                .background(.white)
                                .clipShape(Circle())
                                .modifier(ShadowModifier())
                    }
                    .offset(y: -20)
                }
                .frame(height: 458)
                .sheet(isPresented: $showingSettingView) {
                    SettingView().environmentObject(mainViewModel)
                }
                .sheet(isPresented: $showingEditProfileView) {
                    ProfileViewMiddle().environmentObject(mainViewModel)
                }
                .sheet(isPresented: $showingSaveProfileView) {
                    SaveAccountCenterView().environmentObject(mainViewModel)
                }
                Spacer()
                TabView(selection: $currentIndex) {
                    ForEach(0..<adds.count, id: \.self) { index in
                        Text(adds[index])
                    }
                }
                .padding(.horizontal, 20)
                .frame(width: 400 ,height: 100)
                .tabViewStyle(PageTabViewStyle())
                .onReceive(timer) { _ in
                    withAnimation {
                        currentIndex = currentIndex < adds.count ? currentIndex + 1 : 0
                    }
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
                .frame(width: 200, height: 200)
                .clipShape(Circle())
                .background(
                    Circle().fill(Color.white).scaleEffect(3)
                )
            
        case .success(let image):
            image
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
                    .background(
                        Circle().fill(Color.white).scaleEffect(3)
                    )
        case .failure(let error):
            VStack(spacing: 16) {
                Image(systemName: "xmark.octagon.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
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


struct SettingView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var mainViewModel : MainViewModel
    @State private var phonenumber = "02345678"
    @State private var email = "emailclone01@gmail.com"
    @State private var account = ""
    let phonenumbers = ["02345678", "01234568", "01234567"]
    let emails = ["emailclone01@gmail.com", "emailclone02@gmail.com", "emailclone03@gmail.com"]
    @State private var ischooseMale: Bool = true
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    Text("Settings")
                        .font(.system(size: 26, weight: .bold, design: .default))
                        .foregroundColor(Color.black)
                        .padding(.top, 15)
                    Spacer()
                }
                NavigationView {
                    Form {
                        Section(header: Text("ACCOUNT").font(.system(size: 15, weight: .regular))) {
                            HStack {
                                Text("Email")
                                Spacer()
                                Text("\(mainViewModel.getEmail())")
                            }
                            
                        }
                        Button {
                            UserDefaults.standard.removeObject(forKey: "userlogin")
                            UserDefaults.standard.removeObject(forKey: "userprofile")
                            exit(0)
                        } label: {
                            HStack {
                                Spacer()
                                Text("Sign Out & Leave")
                                    .foregroundColor(.red)
                                Spacer()
                            }
                        }
                        Section {
                            
                        } header: {
                            HStack {
                                Spacer()
                                VStack {
                                    Image("TinderIconColorful")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 40)
                                        .padding(.bottom, 10)
                                    Text("Version 1.1.0").font(.system(size: 17, weight: .regular, design: .default))
                                }
                                Spacer()
                            }
                        }
                        
                        
                    }
                    .padding(.horizontal, -25)
                    .navigationBarBackButtonHidden(true)
                    .navigationBarHidden(true)
                }
                
            }
            .overlay(
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Done")
                        .font(.system(size: 26, weight: .bold, design: .default))
                        .foregroundColor(Color("lightRed"))
                        .padding(.top, 34)
                }
                    .modifier(ClosePresentViewButton()),alignment: .topTrailing
            )
        }
    }
    

}

struct ProfileViewMiddle: View {
    @State var isGoToEditProfile: Bool = true
    @EnvironmentObject var mainViewModel : MainViewModel
    var body: some View {
        ZStack {
            if isGoToEditProfile {
                EditProfileView(active: $isGoToEditProfile)
            } else {
                ProfilePreviewView(active: $isGoToEditProfile)
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
        SettingView()
        ProfileViewMiddle()
        SaveAccountCenterView()
    }
}
