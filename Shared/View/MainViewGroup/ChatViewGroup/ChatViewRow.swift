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

struct ChatViewRow: View {
//    var imgName: String
//    var name: String
//    var lastMessage: String
//    var online: String
    @State var matcher: Matcher
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: matcher.images[0]), content: view)
                    
        //            Image(imgName)
        //                .resizable()
        //                .frame(width: 60, height: 60)
        //                .scaledToFit()
        //                .clipShape(Circle())
        //                .padding(.leading)
        //            if online == "true" {
        //                Image(systemName: "circle.fill")
        //                    .offset(x: -20)
        //                    .foregroundColor(.green)
        //            } else if online == "false" {
        //                Image(systemName: "circle.fill")
        //                    .offset(x: -20)
        //                    .foregroundColor(Color("darkGrey"))
        //            }
                    
                    VStack {
                        HStack {
        //                    Text(name)
        //                        .fontWeight(.bold)
        //                        .padding(.top)
        //                        .foregroundColor(.black)
        //                    Spacer()
                            
                        }
                        HStack{
        //                    Text(lastMessage)
        //                        .foregroundColor(.black)
        //                    Spacer()
                        }
                        Spacer()
                    }
                    .offset(x: -20)
                    Spacer()
//                }
//            }

        }
        .frame(height: 60)
        .padding(.vertical)
    }
    
    @ViewBuilder
    private func view(for phase: AsyncImagePhase) -> some View {
        switch phase {
        case .empty:
                HStack{
                    Spacer()
                    ProgressView()
                    Spacer()
                }
            
        case .success(let image):
            image
                    .resizable()
                    .frame(width: 60, height: 60)
                    .scaledToFit()
                    .clipShape(Circle())
                    .padding(.leading)
                
        case .failure(let error):
            VStack(spacing: 16) {
                Image(systemName: "xmark.octagon.fill")
                    .resizable()
                    
                    
                Text(error.localizedDescription)
                    .multilineTextAlignment(.center)
            }
            .frame(width: 100,height: 150)
        @unknown default:
            Text("Unknown")
                .foregroundColor(.gray)
        }
    }
}

//struct ChatViewRow_Previews: PreviewProvider {
//    static var previews: some View {
//        ChatViewRow(imgName: "gin", name: "Gin", lastMessage: "Đi chơi thôi", online: "false")
//    }
//}
