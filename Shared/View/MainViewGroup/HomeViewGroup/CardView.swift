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
 
struct CardView: View {
    @EnvironmentObject var mainViewModel : MainViewModel
    @State var matcher: Matcher
    @State private var currentIndex = 0
 
    //MARK: GESTURE PROPERTIES
    @State var offsetX: CGFloat = 0
    @State var offsetY: CGFloat = 0
    @GestureState var isDragging: Bool = false
 
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
                    .opacity(Double(offsetX/10 - 1))
                Spacer()
                Image("nopeLabel")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:150)
                    .opacity(Double(offsetX/10 * -1 - 1))
            }
 
        }
        .cornerRadius(10)
        .offset(x: offsetX, y: offsetY)
        .rotationEffect(.init(degrees: getRotation(degree: 8)))
        .gesture (
            DragGesture()
                .updating($isDragging, body: { value, out, _ in
                    out = true
                })
                .onChanged({ value in
                    withAnimation(.default) {
                        let translationX = value.translation.width
                        let translationY = value.translation.height
                        offsetX = (isDragging ? translationX : .zero)
                        offsetY = (isDragging ? translationY : .zero)
                    }
                })
                .onEnded({ value in
 
                    let width = getRect().width - 50
                    let translationX = value.translation.width
 
                    let checkingStatus = (translationX > 0 ? translationX : -translationX)
 
                    //MARK: KHI KÉO HẾT HƠN 1 NỬA ĐỘ RỘNG MÀN HÌNH -> THÌ CARD SẼ ĐC REMOVE QUA TRÁI OR PHẢI
                    withAnimation(.default.speed(0.5)) {
                        if checkingStatus > (width / 2) {
 
                            offsetX = (translationX > 0 ? width : -width) * 2
                            endSwipAction()
 
                            //MARK: XỬ LÝ SỰ KIỆN KHI QUẸT TRÁI QUẸT PHẢI
                            if translationX > 0 {
                                rightSwipe()
                            } else {leftSwipe()}
 
                        } else {
                            offsetX = .zero
                            offsetY = .zero
                        }
                    }
                })
        )
        .onReceive(NotificationCenter.default.publisher(for: Notification.Name("ACTION"), object: nil)) { data in
 
            guard let info = data.userInfo else {
                return
            }
 
            let id = info["id"] as? String ?? ""
            let rightSwipe = info["rightSwipe"] as? Bool ?? false
            let width = getRect().width - 50
 
            if matcher.id == id {
                withAnimation(.default.speed(0.5)) {
                    offsetX = (rightSwipe ? width : -width) * 2
                    endSwipAction()
 
                    if rightSwipe {
                        self.rightSwipe()
                    } else {leftSwipe()}
                }
            }
 
        }
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
 
    func endSwipAction() {
 
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            if let _ = mainViewModel.allUsers.first {
                let _ = withAnimation(.default.speed(0.5)) {
                    mainViewModel.allUsers.removeFirst()
                }
            }
        }
    }
 
    func getRotation(degree: Double) -> Double {
        let rotation = (offsetX / (getRect().width - 50)) * degree
 
        return rotation
    }
 
    func leftSwipe() {
        mainViewModel.addToDislikes(matcherId: matcher.id)
    }
 
    func rightSwipe() {
        mainViewModel.addToLikes(matcherId: matcher.id)
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

