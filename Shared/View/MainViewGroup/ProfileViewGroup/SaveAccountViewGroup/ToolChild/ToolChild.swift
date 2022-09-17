//
//  ToolChild.swift
//  Tinder-FE
//
//  Created by Gia Huy on 11/09/2022.
//

import SwiftUI

struct ToolChild: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        ZStack {
            VStack {
                Image("toolimage1")
                    .resizable().ignoresSafeArea()
                    .scaledToFit()
                HStack {
                    Text("Cách báo cáo")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .padding(.top, 20)
                        .padding(.horizontal, 30)
                    Spacer()
                }
                HStack {
                    Text("Có nhiều cách để báo cáo ai đó trong ứng dụng")
                        .fontWeight(.regular)
                        .foregroundColor(.gray)
                        .padding(.horizontal, 30)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                Divider()
                Text("Bạn sẽ nhận biết được khi ai đó vượt qua ranh giới và khi họ làm thế, chúng tôi muốn biết về điều đó. Chặn và báo cáo bất cứ ai vi phạm các điều khoản của chúng tôi.")
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

struct ToolChild_Previews: PreviewProvider {
    static var previews: some View {
        ToolChild()
    }
}
