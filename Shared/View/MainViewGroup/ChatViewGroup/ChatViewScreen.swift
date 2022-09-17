//
//  ChatViewScreen.swift
//  Tinder-FE
//
//  Created by Gia Huy on 11/09/2022.
//

import SwiftUI

struct ChatViewScreen: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var imgName: String
    var name: String
    var online: String
    @State var demotextfield = ""
    var body: some View {
        VStack {
            HStack {
                Button {
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "chevron.backward")
                        .resizable()
                        .frame(width: 20, height: 30)
                        .foregroundColor(Color("lightRed"))
                        .offset(x: 20)
                }
                Spacer()
                Image(imgName)
                    .resizable()
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                    .offset(x: 5)
                if online == "true" {
                    Image(systemName: "circle.fill")
                        .offset(x: -20, y: 20)
                        .foregroundColor(.green)
                } else if online == "false" {
                    Image(systemName: "circle.fill")
                        .offset(x: -20, y: 20)
                        .foregroundColor(.gray)
                }
                Spacer()
            }
            Text(name)
            ScrollView {
                
            }
            Spacer()
            HStack {
                Spacer()
                Button {
                    
                } label: {
                    Image(systemName: "photo.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(Color("lightRed"))
                        .frame(width: 40)
                }
                TextField("Send Message...", text: $demotextfield)
                    .padding(.horizontal)
                    .frame(width: .infinity, height: 40)
                    .background(.gray.opacity(0.3))
                    .clipShape(Capsule())
                Button {
                    
                } label: {
                    Image(systemName: "paperplane.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(Color("lightRed"))
                        .frame(width: 40)
                }
                Spacer()
            }
            .padding(.horizontal)
            .padding(.vertical)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

struct ChatViewScreen_Previews: PreviewProvider {
    static var previews: some View {
        ChatViewScreen(imgName: "gin", name: "Gin", online: "true")
    }
}
