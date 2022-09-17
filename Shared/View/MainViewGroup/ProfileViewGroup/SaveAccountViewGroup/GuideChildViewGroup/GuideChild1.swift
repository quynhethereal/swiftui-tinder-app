//
//  GuideChild1.swift
//  Tinder-FE
//
//  Created by Gia Huy on 10/09/2022.
//

import SwiftUI

struct GuideChild1: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        ZStack {
            VStack {
                Image("saveProfile2")
                    .resizable().ignoresSafeArea()
                    .scaledToFit()
                HStack {
                    Text("Basic Information")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .padding(.top, 20)
                        .padding(.horizontal, 30)
                    Spacer()
                }
                HStack {
                    Text("Everything you need to know to be safer on Matches and in real life - all in one place")
                        .fontWeight(.regular)
                        .foregroundColor(.gray)
                        .padding(.horizontal, 30)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                Divider()
                Text("Meeting new people is fun, but you always need to be cautious when interacting with people you don't know. Use your best judgment and put your safety first, whether you're exchanging initial messages or meeting in person. While you can't control the actions of others, there are things you can do to help keep yourself safe during your Matches experience.")
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

struct GuideChild1_Previews: PreviewProvider {
    static var previews: some View {
        GuideChild1()
    }
}
