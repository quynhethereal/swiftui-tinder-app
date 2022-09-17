//
//  ChatViewRow.swift
//  Tinder-FE
//
//  Created by Gia Huy on 11/09/2022.
//

import SwiftUI

struct ChatViewRow: View {
    var imgName: String
    var name: String
    var lastMessage: String
    var online: String
    var body: some View {
        HStack {
            Image(imgName)
                .resizable()
                .frame(width: 60, height: 60)
                .scaledToFit()
                .clipShape(Circle())
                .padding(.leading)
            if online == "true" {
                Image(systemName: "circle.fill")
                    .offset(x: -20)
                    .foregroundColor(.green)
            } else if online == "false" {
                Image(systemName: "circle.fill")
                    .offset(x: -20)
                    .foregroundColor(Color("darkGrey"))
            }
            
            VStack {
                HStack {
                    Text(name)
                        .fontWeight(.bold)
                        .padding(.top)
                        .foregroundColor(.black)
                    Spacer()
                    
                }
                HStack{
                    Text(lastMessage)
                        .foregroundColor(.black)
                    Spacer()
                }
                Spacer()
            }
            .offset(x: -20)
            Spacer()
        }
        .frame(height: 60)
        .padding(.vertical)
    }
}

struct ChatViewRow_Previews: PreviewProvider {
    static var previews: some View {
        ChatViewRow(imgName: "gin", name: "Gin", lastMessage: "Đi chơi thôi", online: "false")
    }
}
