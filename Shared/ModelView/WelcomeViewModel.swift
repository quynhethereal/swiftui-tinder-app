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

// Currently use Tinder's terms. But we will have our own soon ;)
class WelcomeViewModel: ObservableObject {
    
    //Return Attributed String and Hyperlink
    func getAttributedString(_ string: String) -> AttributedString {
        var attributedString = AttributedString(string)
        //Apllying bold and underline to hyperlink
        if let range = attributedString.range(of: "Terms") {
            
            attributedString[range].underlineStyle = .single
            attributedString[range].underlineColor = .white
            attributedString[range].font = .system(size: 17, weight: .bold)
            attributedString[range].link = .init(string: "https://policies.tinder.com/terms/intl/en")
            attributedString[range].foregroundColor = .white
        }
        if let range = attributedString.range(of: "Privacy Policy") {
            
            attributedString[range].underlineStyle = .single
            attributedString[range].underlineColor = .white
            attributedString[range].font = .system(size: 17, weight: .bold)
            attributedString[range].link = .init(string: "https://policies.tinder.com/privacy/intl/en")
            attributedString[range].foregroundColor = .white
        }
        if let range = attributedString.range(of: "Cookie Policy") {
            
            attributedString[range].underlineStyle = .single
            attributedString[range].underlineColor = .white
            attributedString[range].font = .system(size: 17, weight: .bold)
            attributedString[range].link = .init(string: "https://policies.tinder.com/cookie-policy/intl/en")
            attributedString[range].foregroundColor = .white
        }
        return attributedString
    }
}
