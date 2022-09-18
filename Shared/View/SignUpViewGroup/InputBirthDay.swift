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
import Combine

struct InputBirthDay: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var signUpVMGroup : ProfileRegistrationViewModel
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
                        Text("My Birthday\nis")
                            .font(.system(size: 50, weight: .bold, design: .default))
                            .padding(.leading, 50)
                        Spacer()
                    }
                    Spacer().frame(height: 40)
                    HStack {
                        Spacer()
                        DatePicker("Choose Your Birth Date", selection: $birthDate, in: startingDate...endingDate, displayedComponents: [.date])
                            .accentColor(Color("lightRed"))
                            .datePickerStyle(
                                GraphicalDatePickerStyle()
                            )
                        Spacer()
                    }
                    .labelsHidden()
                    Text("Your age will be publicly displayed")
                        .frame(width: 320)
                        .font(.system(size: 17, weight: .bold, design: .default))
                        .foregroundColor(Color("darkGrey"))
                    Spacer()
                    NavigationLink(destination: ChooseGenderView(), tag: 1,selection: $selection) {
                        Button {
                            
                            if(disableButton == true) {
                                signUpVMGroup.addBithDay(date: birthDate)
                                self.selection = 1
                            }
                        }
                    label: {
                        
                        Text("NEXT")
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
