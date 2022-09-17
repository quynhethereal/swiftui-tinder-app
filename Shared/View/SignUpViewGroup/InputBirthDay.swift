//
//  InputBirthDay.swift
//  Tinder-FE
//
//  Created by Gia Huy on 07/09/2022.
//

import SwiftUI
import Combine

struct InputBirthDay: View {
    
//    enum FocusField: Hashable {
//        case field
//    }
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var signUpVMGroup : ProfileRegistrationViewModel
//    @FocusState private var focusedField: FocusField?
//    @State private var disableButton: Bool = true
    @State var birthDate: Date = Date()
    @State private var selection: Int? = nil
    @State private var disableButton: Bool = true
    
    let startingDate: Date = Calendar.current.date(from: DateComponents(year: 1970)) ?? Date()
    let endingDate: Date = Date()
    
    let textLimit = 8
    
    var body: some View {
        NavigationView {
            ZStack {
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
                    HStack {
                        Spacer()
                        DatePicker("Choose Your BirthDate", selection: $birthDate, in: startingDate...endingDate, displayedComponents: [.date])
                            .accentColor(Color("lightRed"))
                            .datePickerStyle(
                                GraphicalDatePickerStyle()
                            )
                        Spacer()
                    }
                    .labelsHidden()
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
                            
                            
                        }
                    label: {
                            
                                Text("TIẾP TỤC")
                                    .modifier(ButtonNextEnable())
                            
                            
                        }
                    }

                    
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

}



struct InputBirthDay_Previews: PreviewProvider {
    static var previews: some View {
        InputBirthDay()
    }
}
