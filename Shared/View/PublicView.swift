//
//  PublicView.swift
//  TinderApp
//
//  Created by Dat Duong on 12/09/2022.
//

import SwiftUI

struct PublicView: View {
    @EnvironmentObject var userAuth: UserSignInViewModel
    @State var isActive: Bool = true
    var body: some View {
        ZStack {
            
            if isActive {
                SignInView(isActive: $isActive).environmentObject(userAuth)
            } else {
                SignUpView(isActive: $isActive)
            }
        }
    }
}

struct PublicView_Previews: PreviewProvider {
    static let userAuth = UserSignInViewModel()
    static var previews: some View {
        PublicView().environmentObject(userAuth)
    }
}
