//
//  GuideChild2.swift
//  Tinder-FE
//
//  Created by Gia Huy on 10/09/2022.
//

import SwiftUI

struct GuideChild2: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        ZStack {
            VStack {
                Image("saveProfile3")
                    .resizable().ignoresSafeArea()
                    .scaledToFit()
                HStack {
                    Text("Treatment")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .padding(.top, 20)
                        .padding(.horizontal, 30)
                    Spacer()
                }
                HStack {
                    Text("If you see something wrong, speak up")
                        .fontWeight(.regular)
                        .foregroundColor(.gray)
                        .padding(.horizontal, 30)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                Divider()
                Text("You'll notice when someone crosses a line, and when they do, we want to know about it. Block and report anyone who violates our terms.")
                    .fontWeight(.regular)
                    .foregroundColor(.black)
                    .padding(.horizontal, 30)
                    .multilineTextAlignment(.leading)
                    .padding(.top, 15)
                Spacer()
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
            
            VStack {
                HStack {
                    Button {
                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "chevron.backward")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 15)
                            .foregroundColor(.black)
                            .padding()
                    }
                    Spacer()
                }
                Spacer()
            }
        }
    }
}

struct GuideChild2_Previews: PreviewProvider {
    static var previews: some View {
        GuideChild2()
    }
}
