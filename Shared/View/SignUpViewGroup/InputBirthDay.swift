//
//  InputBirthDay.swift
//  Tinder-FE
//
//  Created by Gia Huy on 07/09/2022.
//

import SwiftUI
import Combine

struct InputBirthDay: View {
    
    enum FocusField: Hashable {
        case field
    }
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var signUpVMGroup : ProfileRegistrationViewModel
    @FocusState private var focusedField: FocusField?
    @State private var disableButton: Bool = true
    @State var birthDate = ""
    @State private var selection: Int? = nil
    
    
    let textLimit = 8
    
    var body: some View {
        NavigationView {
            ZStack {
                TextField("", text: $birthDate)
                    .focused($focusedField, equals: .field)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            self.focusedField = .field
                        }
                    }
                    .onReceive(Just($birthDate)) {_ in limitText(textLimit) }
                    .keyboardType(.numberPad)
                Color.white.ignoresSafeArea()
                VStack {
                    Spacer().frame(height: 80)
                    HStack {
                        Text("Sinh nhật\ncủa tôi là")
                            .font(.system(size: 50, weight: .bold, design: .default))
                            .padding(.leading, 50)
                        Spacer()
                    }
                    Spacer().frame(height: 40)
                    HStack(spacing: 10) {
                        ForEach(0..<8,id: \.self) { index in
                            FormatDateTextFieldView(birthday: getElementAtIndex(index: index))
                            if index == 1 || index == 3 {
                                Text("/")
                                    .font(.title)
                                    .foregroundColor(Color.gray.opacity(0.5))
                            }
                        }
                    }
                    .padding(.horizontal, 30)
                    Text("Tuổi của bạn sẽ được hiển thị công khai")
                        .frame(width: 320)
                        .font(.system(size: 17, weight: .bold, design: .default))
                        .foregroundColor(Color("darkGrey"))
                    Spacer()
                    NavigationLink(destination: ChooseGenderView(), tag: 1,selection: $selection) {
                        Button {
//                            if(disableButton == false) {
//                                signUpVMGroup.addBithDay(date: birthDate)
//                                self.selection = 1
//                            }
                            if(disableButton == true) {
                                signUpVMGroup.addBithDay(date: birthDate)
                                self.selection = 1
                            }
                            
                            
                        } label: {
                            if birthDate == "" || birthDate.count < 8 {
                                Text("TIẾP TỤC")
                                    .modifier(ButtonNextDisable())
                            } else {
                                Text("TIẾP TỤC")
                                    .modifier(ButtonNextEnable())
                            }
                            
                        }
                    }
//                    .disabled(disableButton)
//                    .padding(.horizontal, 30)
//                    .onChange(of: self.birthDate, perform: { _ in
//                        if !(birthDate == "" && birthDate.count == 8) {
//                            self.disableButton = false
//                        } else {
//                            self.disableButton = true
//                        }
//                    })

                    
                }
                .navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)
                .overlay(
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Image("darkGrayBackButton")
                            .resizable()
                            .scaledToFit()
                    }
                        .modifier(BackButtonModifier()),
                    alignment: .topLeading
                )
                .padding(20)
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        
    }
    func getElementAtIndex(index: Int) -> String {
        if birthDate.count > index {
            let start = birthDate.startIndex
            let current = birthDate.index(start, offsetBy: index)
            
            return String(birthDate[current])
        }
        return ""
    }
    //Function to keep text length in limits
    func limitText(_ limit: Int) {
        if birthDate.count > limit {
            birthDate = String(birthDate.prefix(limit))
        }
    }
}

struct FormatDateTextFieldView: View {
    var birthday: String
    
    var body: some View {
        VStack {
            Text(birthday)
                .foregroundColor(.black)
                .fontWeight(.light)
                .font(.title)
                .frame(height: 45)
            
            Capsule()
                .fill(Color.gray.opacity(0.5))
                .frame(height: 4)
            
            
        }
    }
}


struct InputBirthDay_Previews: PreviewProvider {
    static var previews: some View {
        InputBirthDay()
    }
}
