//
//  ProfileRegistrationView.swift
//  TinderApp
//
//  Created by Le Helen on 03/09/2022.
//

import SwiftUI

struct ProfileRegistrationView: View {
    
    @State var sourceItems: [String] = ["Movies", "Sports", "Study", "Travel", "Books"]
    @StateObject var viewModel = ProfileRegistrationViewModel()
    @EnvironmentObject var userViewModel: UserSignInViewModel
    
    var body: some View {
        Form {
            List {
                ForEach(sourceItems, id: \.self) { item in
                    Button(action: {
                        withAnimation {
                            if self.viewModel.userProfile.preferredTopic.contains(item) {
                                //you may need to adapt this piece, my object has an ID I match against rather than just the string
                                self.viewModel.userProfile.preferredTopic.removeAll(where: { $0 == item })
                            } else {
                                self.viewModel.addTopic(topic: item)
                                print(self.viewModel.userProfile)
                            }
                        }
                    }) {
                        HStack {
                            Image(systemName: "checkmark")
                                .opacity(self.viewModel.userProfile.preferredTopic.contains(item) ? 1.0 : 0.0)
                            Text("\(item)")
                        }
                    }
                    .foregroundColor(.primary)
                }
            }
            Button(action:{
                // todo: handle error
                viewModel.createNewProfile(userProfile: viewModel.userProfile){result in} }) {
                Text("Save Preferences")
            }
        }
    }
}

struct ProfileRegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileRegistrationView()
    }
}
