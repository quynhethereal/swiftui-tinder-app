//
//  WelcomeView.swift
//  Tinder-FE
//
//  Created by Gia Huy on 05/09/2022.
//

import SwiftUI

struct WelcomeView: View {
    @StateObject var welcomeVM = WelcomeViewModel()

    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color("lightPink"), Color("lightRed")]), startPoint: .leading, endPoint: .trailing)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Spacer()
                    //MARK: - LOGO
                    Image("tinderLabel")
                        .resizable()
                        .scaledToFit()
                        .frame(minWidth: 150, idealWidth: 200, maxWidth: 200, alignment: .center)
                        .padding(.vertical, 70)
                    //MARK: - LABEL
                    Text(welcomeVM.getAttributedString("Khi nhấn Tạo Tài Khoản hoặc Đăng Nhập, bạn đồng ý với Điều Khoản của chúng tôi. Tìm hiểu về cách chúng tôi xử lý dữ liệu của bạn trong Chính sách Quyền Riêng Tư và Chính sách Cookie của chúng tôi."))
                        .font(.system(size: 17, weight: .medium, design: .default))
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 25)
                        .padding(.bottom, 20)
                    
                 
                 
                    
                    //MARK: - BUTTON GET START
                    NavigationLink {
                        PublicView()
                    } label: {
                        Text("GET START")
                            .frame(maxWidth: .infinity, minHeight: 55)
                            .tint(.white)
                            .font(.system(size: 20, weight: .medium, design: .default))
                            .overlay(
                                Capsule(style: .circular)
                                            .stroke(Color.white, style: StrokeStyle(lineWidth: 3))
                            )
                    }
                    .padding(.horizontal, 30)
                    Spacer().frame(height: 100)
                }
                .navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
