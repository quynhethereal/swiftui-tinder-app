//
//  ButtonSection.swift
//  TinderApp (iOS)
//
//  Created by Dat Duong on 13/09/2022.
//

import SwiftUI

struct ButtonSection: View {
    @EnvironmentObject var mainViewModel : MainViewModel
    var body: some View {
        HStack(spacing: 15) {
            Button(action: {
                
            }) {
                Image("resetButton")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 55, height: 55)
            }
            Button(action: {}) {
                Image("nopeButton")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 75, height: 75)
            }
            Button(action: {}) {
                Image("supperLikeButton")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 55, height: 55)
            }
            Button(action: {}) {
                Image("likeButton")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 75, height: 75)
            }
            Button(action: {}) {
                Image("boostButton")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 55, height: 55)
            }
        }
        .padding(.top, 580)
        .zIndex(1.5)
    }
    
}

struct ButtonSection_Previews: PreviewProvider {
    static var previews: some View {
        ButtonSection()
    }
}
