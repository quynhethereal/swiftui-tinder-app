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
    @State private var currentIndex = 0
    
    // MARK: - Drawing Constant
    let cardGradient = Gradient(colors: [Color.black.opacity(0.2), Color.black.opacity(0.2)])
    
    var body: some View {
        ZStack(alignment: .topLeading) {

            TabView(selection: $currentIndex) {
                ForEach(0..<matcher.images.count, id: \.self) { index in
                    AsyncImage(url: URL(string: matcher.images[index]), content: view)
                        .tag(index)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .tabViewStyle(PageTabViewStyle())
            .background(Color.white)
            
            // Linear Gradient
            LinearGradient(gradient: cardGradient, startPoint: .top, endPoint: .bottom)
            HStack {
                Button {
                    previous()
                } label: {
                    Image("localimage")
                        .resizable()
                        .frame(width: 100 ,height: 470)
                        .hidden()
                    
                }
                Spacer()
                Button {
                    next()
                } label: {
                    Image("localimage")
                        .resizable()
                        .frame(width: 100 ,height: 470)
                        .hidden()
                        
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .offset(y: 70)
            VStack {
                Spacer()
                VStack(alignment: .leading){
                    HStack {
                        Text(matcher.name).font(.largeTitle).fontWeight(.bold)
                        Text(String(matcher.age)).font(.title)
                    }
                    if matcher.preferredTopic.count <= 3 {
                        HStack {
                            ForEach(matcher.preferredTopic.indices, id: \.self) { index in
                                Text(matcher.preferredTopic[index])
                                    .font(.system(size: 13))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                    .padding(.horizontal)
                                    .modifier(TopicDesign())
                               
                            }
                            
                        }
                        .multilineTextAlignment(.leading)
                    } else {
                        HStack {
                            ForEach(matcher.preferredTopic.indices, id: \.self) { index in
                                if index == 0 || index == 1 || index == 2 {
                                    Text(matcher.preferredTopic[index])
                                        .font(.system(size: 13))
                                        .fontWeight(.semibold)
                                        .foregroundColor(.white)
                                        .padding(.horizontal)
                                        .modifier(TopicDesign())
                                }
                            }
                        }
                        HStack {
                            ForEach(matcher.preferredTopic.indices, id: \.self) { index in
                                if index != 0 && index != 1 && index != 2 {
                                    Text(matcher.preferredTopic[index])
                                        .font(.system(size: 13))
                                        .fontWeight(.semibold)
                                        .foregroundColor(.white)
                                        .padding(.horizontal)
                                        .modifier(TopicDesign())
                                }
                            }
                        }
                    }
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
    
    func previous() {
        withAnimation {
            currentIndex = currentIndex > 0 ? currentIndex - 1 : matcher.images.count - 1
        }
    }
    
    func next() {
        withAnimation {
            currentIndex = currentIndex < matcher.images.count ? currentIndex + 1 : 0
        }
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
