//
//  HomeView.swift
//  TinderApp
//
//  Created by Le Helen on 02/09/2022.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            VStack {
                Image("TinderLabelColorful")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                    .padding(.top, 25)
                ZStack {
                    CardsSection()
                    ButtonSection()
                }
                Spacer()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        
        HomeView()
    }
}
