//
//  WelcomeViewModel.swift
//  Tinder-FE
//
//  Created by Gia Huy on 05/09/2022.
//

import SwiftUI

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
