//
//  GuideChild1.swift
//  Tinder-FE
//
//  Created by Gia Huy on 10/09/2022.
//

import SwiftUI

struct GuideChild1: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        ZStack {
            VStack {
                Image("saveProfile2")
                    .resizable().ignoresSafeArea()
                    .scaledToFit()
                HStack {
                    Text("Thông tin cơ bản")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .padding(.top, 20)
                        .padding(.horizontal, 30)
                    Spacer()
                }
                HStack {
                    Text("Những điều bạn cần biết để an toàn hơn trên Tinder và khi gặp gỡ ngoài đời - tất cả ở cùng 1 nơi")
                        .fontWeight(.regular)
                        .foregroundColor(.gray)
                        .padding(.horizontal, 30)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                Divider()
                Text("Gặp gỡ những người mới rất thú vị, nhưng bạn luôn cần thận trọng khi tương tác với người mà bạn không biết. Sử dụng phán đoán nhạy bén nhất của mình và đặt sự an toàn của bản thân lên hàng đầu, cho dù bạn đang trao đổi những tin nhắn ban đầu hay gặp mặt trực tiếp. Mặc dù bạn không thể kiểm soát hành động của người khác, nhưng có những điều bạn có thể làm để giúp chính bạn được an toàn trong quá trình trải nghiệm Tinder.")
                    .fontWeight(.regular)
                    .foregroundColor(.black)
                    .padding(.horizontal, 30)
                    .multilineTextAlignment(.leading)
                    .padding(.top, 15)
                Spacer()
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
            
            VStack {
                HStack {
                    Button {
                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "chevron.backward")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 15)
                            .foregroundColor(.black)
                            .padding()
                    }
                    Spacer()
                }
                Spacer()
            }
        }
    }
}

struct GuideChild1_Previews: PreviewProvider {
    static var previews: some View {
        GuideChild1()
    }
}
