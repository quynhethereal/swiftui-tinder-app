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

            VStack {
                Spacer()
                AsyncImage(url: URL(string: matcher.images[0]), content: view)
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
                    HStack {
                        ForEach(matcher.preferredTopic.indices, id: \.self) { index in
                            Text(matcher.preferredTopic[index])
                                .font(.system(size: 12))
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .modifier(TopicDesign())
                           
                        }
                        
                    }
                    .multilineTextAlignment(.leading)
                    
                    
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
                                mainViewModel.addToDislikes(matcherId: matcher.id)
                            default:

                                matcher.x = 0; matcher.y = 0
                                print("case default")
                        }
                    }
                })
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
                    .aspectRatio(contentMode: .fit)
            
        case .failure(let error):
            VStack(spacing: 16) {
                Image(systemName: "xmark.octagon.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.red)
//                Text(error.localizedDescription)
//                    .multilineTextAlignment(.center)
            }
        @unknown default:
            Text("NO USERS")
                .foregroundColor(.gray)
        }
    }

}

//struct CardView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardView(matcher: Card.data[0])
//            .previewLayout(.sizeThatFits)
//    }
//}

