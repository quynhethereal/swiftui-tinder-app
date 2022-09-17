//
//  ChatBotViewScreen.swift
//  Tinder-FE
//
//  Created by Gia Huy on 12/09/2022.
//

import SwiftUI

struct ChatBotViewScreen: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var imgName: String
    var name: String
    var online: String
    @State private var animatingPickerAppear = false
    @State private var messageText = ""
    @State var messages: [String] = ["Hé nhô, bạn cần phủ thuỳ tình iuu đây tư vấn gì vậy, bạn có thể tìm kiếm những câu hỏi thông dụng mà mọi người hay hỏi mình bằng cách nhấn nút ≡ bên dưới"]
    @State private var templateQuesion: [String] = [
        "Bí quyết an toàn khi hẹn hò",
        "Những lưu ý khi gặp gỡ trực tiếp",
    ]
    var body: some View {
        VStack {
            HStack {
                Button {
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "chevron.backward")
                        .resizable()
                        .frame(width: 20, height: 30)
                        .foregroundColor(Color("lightRed"))
                        .offset(x: 20, y: 15)
                }
                Spacer()
                Image(imgName)
                    .resizable()
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                    .offset(x: 5)
                if online == "true" {
                    Image(systemName: "circle.fill")
                        .offset(x: -20, y: 20)
                        .foregroundColor(.green)
                } else if online == "false" {
                    Image(systemName: "circle.fill")
                        .offset(x: -20, y: 20)
                        .foregroundColor(.gray)
                }
                Spacer()
            }
            Text(name)
            ScrollView {
                ForEach(messages, id: \.self) { message in
                    // If the message contains [USER], that means it's us
                    if message.contains("[USER]") {
                        let newMessage = message.replacingOccurrences(of: "[USER]", with: "")
                        
                        // User message styles
                        HStack {
                            Spacer()
                            Text(newMessage)
                                .padding()
                                .font(.system(size: 14))
                                .foregroundColor(Color.white)
                                .background(Color("lightRed"))
                                .clipShape(Capsule())
                                .padding(.horizontal, 15)
                                .padding(.vertical)
                        }
                    } else {
                        
                        // Bot message styles
                        HStack {
                            Text(message)
                                .padding()
                                .font(.system(size: 14))
                                .background(Color.white)
                                .foregroundColor(Color("lightRed"))
                                .clipShape(RoundedRectangle(cornerRadius: 25))
                                .padding(.horizontal, 16)
                                .padding(.bottom, 10)
                            Spacer()
                        }
                    }
                    
                }.rotationEffect(.degrees(180))
            }
            .rotationEffect(.degrees(180))
            .background(Color.gray.opacity(0.1))
            Spacer()
            VStack {
                HStack {
                    Spacer()
                    Button {
                        self.animatingPickerAppear.toggle()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(Color("lightRed"))
                            .frame(width: 40)
                    }
                    TextField("Send Message...", text: $messageText)
                        .padding(.horizontal)
                        .frame(width: .infinity, height: 40)
                        .background(.gray.opacity(0.3))
                        .clipShape(Capsule())
                        .onSubmit {
                            sendMessage(message: messageText)
                        }
                    
                    Button {
                        sendMessage(message: messageText)
                    } label: {
                        Image(systemName: "paperplane.fill")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(Color("lightRed"))
                            .frame(width: 40)
                    }
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.vertical)
                if animatingPickerAppear {
                    Picker("Chọn", selection: $messageText) {
                        ForEach(templateQuesion, id: \.self) { question in
                            Text(question)
                        }
                    }
                    .frame(height: 150)
                    .pickerStyle(.wheel)
                }
            }
            .animation(.default, value: animatingPickerAppear)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
    
    func sendMessage(message: String) {
        if !message.trimmingCharacters(in: .whitespaces).isEmpty {
            withAnimation {
                messages.append("[USER]" + message)
                self.messageText = ""
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    withAnimation {
                        messages.append(getBotResponse(message: message))
                    }
                }
            }
        } else {
            return
        }
    }
}

struct ChatBotViewScreen_Previews: PreviewProvider {
    static var previews: some View {
        ChatBotViewScreen(imgName: "tinderBot", name: "Phù thuỷ tình iuu", online: "true")
    }
}
