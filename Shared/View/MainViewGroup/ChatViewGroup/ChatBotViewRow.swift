/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2022B
 Assessment: Assignment 3
 Author: Error Team
 Duong Tuan Dat - s3636739
 Le Trung Kim - s3634824
 Le Dinh Ngoc Quynh - s3791159
 Thuan Nguyen - s3517236
 Created  date: 27/08/2022
 Last modified: 18/09/2022
 Acknowledgement: Acknowledge the resources that you use here.
 */

import SwiftUI

struct ChatBotViewRow: View {
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
