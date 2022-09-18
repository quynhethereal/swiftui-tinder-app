//
//  CardsSection.swift
//  TinderApp (iOS)
//
//  Created by Dat Duong on 13/09/2022.
//

import SwiftUI

struct CardsSection: View {
    @EnvironmentObject var mainViewModel : MainViewModel
    var body: some View {
        ZStack{
            if mainViewModel.allUsers.isEmpty {
                Text("No Matching User")
                    .multilineTextAlignment(.center)
            } else {
                ForEach(mainViewModel.allUsers) { matcher in
                    CardView(matcher: matcher)
                }
            }
            
        }
        .padding(10)
        .zIndex(1.0)
    }
}

struct CardsSection_Previews: PreviewProvider {
    static var previews: some View {
        CardsSection()
    }
}
