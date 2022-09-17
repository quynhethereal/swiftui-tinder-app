//
//  LoadingView.swift
//  Tinder-FE
//
//  Created by Gia Huy on 05/09/2022.
//

import SwiftUI


struct RootView: View {
    @State var isActive: Bool = true
    
    var body: some View {
        ZStack {
            if isActive {
                LoadingView(isActive: $isActive)
            } else {
                
                WelcomeView()
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

struct LoadingView: View {
    
    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    @Binding var isActive: Bool
    @State var count: Int = 3
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("lightPink"), Color("lightRed")]), startPoint: .leading, endPoint: .trailing)
                .edgesIgnoringSafeArea(.all)
            AnimationLoadingLogoView(nameAnimate: "fire")
                .frame(width: 200, height: 200, alignment: .center)
        }
        .onReceive(timer, perform: {_ in
            if count <= 1 {
                isActive = false
            } else {
                count -= 1
            }
        })
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(isActive: .constant(true))
    }
}
