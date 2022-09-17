//
//  ProfilePreviewView.swift
//  Tinder-FE
//
//  Created by Gia Huy on 10/09/2022.
//

import SwiftUI

struct ProfilePreviewView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var currentIndex = 0
    @Binding var active: Bool
    let demoImageArray = ["rum", "vodka", "chianti", "gin", "tequila"]
    
    func previous() {
        withAnimation {
            currentIndex = currentIndex > 0 ? currentIndex - 1 : demoImageArray.count - 1
        }
    }
    
    func next() {
        withAnimation {
            currentIndex = currentIndex < demoImageArray.count ? currentIndex + 1 : 0
        }
    }
    
    
    var body: some View {
        ZStack {
            Color("darkGrey").ignoresSafeArea()
            VStack {
                VStack {
                    HStack {
                        Spacer()
                        Text("Xem trước")
                            .font(.system(size: 26, weight: .bold, design: .default))
                            .foregroundColor(Color.black)
                            .padding(.top, 25)
                        Spacer().frame(width: 30)
                        Button {
                            self.presentationMode.wrappedValue.dismiss()
                        } label: {
                            Text("Xong")
                                .font(.system(size: 26, weight: .bold, design: .default))
                                .foregroundColor(Color("lightRed"))
                                .modifier(ClosePresentViewButton())
                                .padding(.top, 25)
                        }
                        Spacer().frame(width: 15)
                    }
                    HStack {
                        Spacer()
                        Button {
                            self.active = true
                        } label: {
                            Text("Chỉnh sửa")
                                .font(.system(size: 25, weight: .heavy, design: .default))
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        Divider().frame(height: 40)
                        Spacer()
                        Button {
                            self.active = false
                        } label: {
                            Text("Xem trước")
                                .font(.system(size: 25, weight: .heavy, design: .default))
                                .foregroundColor(Color("lightPink"))
                        }
                        Spacer()
                    }
                    .padding(25)
                }
                .frame(height: 150)
                .background(.white.opacity(0.7))
                Spacer()
                TabView(selection: $currentIndex) {
                    ForEach(0..<demoImageArray.count, id: \.self) { index in
                        Image(demoImageArray[index])
                            .resizable()
                            .scaledToFill()
                            .tag(index)
                    }
                }
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .frame(width: 350 ,height: 600)
                .tabViewStyle(PageTabViewStyle())
                Spacer()
            }
            HStack {
                Button {
                    previous()
                } label: {
                    Image("localimage")
                        .resizable()
                        .frame(width: 100 ,height: 470)
                        .hidden()
                    
                }
                Spacer()
                Button {
                    next()
                } label: {
                    Image("localimage")
                        .resizable()
                        .frame(width: 100 ,height: 470)
                        .hidden()
                        
                }
            }
            .frame(width: 350 ,height: 500)
            .offset(y: 70)
            
            HStack {
                Text("AhCoHol").font(.largeTitle).fontWeight(.heavy)
                    .padding(.leading, 45)
                Text("20").font(.title)
                Spacer()
            }
            .frame(height: 50)
            .offset(y: 280)
            .foregroundColor(.white)
            HStack {
                Spacer()
                Button {
                    
                } label: {
                    Image(systemName: "info.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25)
                }
                Spacer().frame(width: 50)
            }
            .frame(height: 50)
            
            .offset(y: 320)
            .foregroundColor(.white)
        }
    }
}

struct ProfilePreviewView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePreviewView(active: .constant(false))
    }
}
