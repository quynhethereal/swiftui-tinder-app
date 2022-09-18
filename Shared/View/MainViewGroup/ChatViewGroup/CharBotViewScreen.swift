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

// Chatbot Screen
struct ChatBotViewScreen: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var imgName: String
    var name: String
    var online: String
    @State private var animatingPickerAppear = false
    @State private var messageText = ""
    @State var messages: [String] = ["Hello, What advice do you need from Love Witcher, you can find common questions that people ask you by pressing the ≡ button below"]
    @State private var templateQuesion: [String] = [
        "Safety tips when dating",
        "Notes when meeting face-to-face",
        "If your 15 year old self could see you today, what would they think?",
        "What would it take for someone to take you off this app?",
        "Tea, coffee or tequila?",
        "What’s something you would never tell anyone but a total stranger you’ll never meet again?",
        "What’s your idea of a perfect date?",
        "How much time do you think a couple should spend apart?",
        "What was the worst date you ever went on?",
        "What’s your idea of a perfect day?"
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
                    Picker("Select", selection: $messageText) {
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
                        print(message)
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
        ChatBotViewScreen(imgName: "tinderBot", name: "Love Witcher", online: "true")
    }
}
