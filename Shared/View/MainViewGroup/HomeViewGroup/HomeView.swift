//
//  HomeView.swift
//  TinderApp
//
//  Created by Le Helen on 02/09/2022.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var mainViewModel : MainViewModel
    var body: some View {
        ZStack {
            VStack {
                Image("TinderLabelColorful")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                    .padding(.top, 25)
                ZStack {
                    CardsSection().environmentObject(mainViewModel)
                    ButtonSection().environmentObject(mainViewModel)
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
