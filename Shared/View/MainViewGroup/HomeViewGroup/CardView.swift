//
//  CardView.swift
//  TinderApp (iOS)
//
//  Created by Dat Duong on 13/09/2022.
//

import SwiftUI

struct CardView: View {
    @EnvironmentObject var mainViewModel : MainViewModel
    @State var matcher: Matcher
    
    // MARK: - Drawing Constant
    let cardGradient = Gradient(colors: [Color.black.opacity(0.2), Color.black.opacity(0.2)])
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            
//            VStack {
//
//                AsyncImage(url: URL(string: matcher.images[0]))
//
//            }
//            .frame(width:200, height:300)
            VStack {
                Spacer()
                AsyncImage(url: URL(string: matcher.images[0])) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipped()
                        
                        
                } placeholder: {
                    Image(systemName: "photo")
                        .imageScale(.large)
                        .foregroundColor(.white)
                }
                .ignoresSafeArea()
//                .foregroundColor(Color(.black))
                
                Spacer()
            }
            .background(.white)
            
                
            
            // Linear Gradient
            LinearGradient(gradient: cardGradient, startPoint: .top, endPoint: .bottom)
            VStack {
                Spacer()
                VStack(alignment: .leading){
                    HStack {
                        Text(matcher.name).font(.largeTitle).fontWeight(.bold)
                        Text(String(matcher.age)).font(.title)
                    }
//                    HStack {
//                        Image(systemName: "circle.fill")
//                            .foregroundColor(.green)
//                        Text(card.activeStatus[0]).font(.body)
//                    }
//                    HStack {
//                        Image(systemName: "house")
//                            .tint(.white)
//                        Text(card.state).font(.body)
//                    }
                    
                }
                .padding(.bottom, 100)
            }
            .padding()
            .foregroundColor(.white)
            
            HStack {
                Image("likeLabel")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:150)
                    .opacity(Double(matcher.x/10 - 1))
                Spacer()
                Image("nopeLabel")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:150)
                    .opacity(Double(matcher.x/10 * -1 - 1))
            }
            
        }
//        .foregroundColor(Color(.white))
        .cornerRadius(10)
        .offset(x: matcher.x, y: matcher.y)
        .rotationEffect(.init(degrees: matcher.degree))
        .gesture (
            DragGesture()
                .onChanged { value in
                    withAnimation(.default) {
                        matcher.x = value.translation.width
                        // MARK: - BUG 5
                        matcher.y = value.translation.height
                        matcher.degree = 7 * (value.translation.width > 0 ? 1 : -1)
                    }
                }
                .onEnded { (value) in
                    withAnimation(.interpolatingSpring(mass: 1.0, stiffness: 50, damping: 8, initialVelocity: 0)) {
                        switch value.translation.width {
                        case 0...100:
                                matcher.x = 0; matcher.degree = 0; matcher.y = 0
                                print("case 1")
                        case let x where x > 100:
                                matcher.x = 500; matcher.degree = 12
                                print("Có")
                                mainViewModel.addToLikes(matcherId: matcher.id)
                        case (-100)...(-1):
                                matcher.x = 0; matcher.degree = 0; matcher.y = 0
                                print("case 3")
                        case let x where x < -100:
                                matcher.x  = -500; matcher.degree = -12
                                print("Không")
                        default:
                                matcher.x = 0; matcher.y = 0
                                print("case default")
                        }
                    }
                })
    }
}

//struct CardView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardView(matcher: Card.data[0])
//            .previewLayout(.sizeThatFits)
//    }
//}

