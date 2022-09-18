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

struct BackButtonModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
          .frame(width: 25, height: 35)
  }
}

struct ShadowModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .shadow(color:Color("ColorBlackTransparent"), radius: 4)
    }
}

struct ClosePresentViewButton: ViewModifier {
  func body(content: Content) -> some View {
    content
          .frame(width: 100, height: 26)
  }
}

//MARK: - BUTTON 'Xong'
struct IgnoreButton: ViewModifier {
  func body(content: Content) -> some View {
    content
          .font(.system(size: 25, weight: .bold, design: .default))
          .foregroundColor(Color("lightGrey"))
  }
}

struct ButtonOfFavoriteDisable: ViewModifier {
  func body(content: Content) -> some View {
    content
          .frame(minHeight: 40)
          .foregroundColor(.gray)
          .font(.system(size: 15, weight: .heavy, design: .default))
          .padding(.horizontal, 15)
          .overlay(
              Capsule(style: .circular)
                  .stroke(Color.gray, style: StrokeStyle(lineWidth: 3))
          )
  }
}

struct ButtonOfFavoriteEnable: ViewModifier {
  func body(content: Content) -> some View {
    content
          .frame(minHeight: 40)
          .foregroundColor(Color("lightRed"))
          .font(.system(size: 15, weight: .heavy, design: .default))
          .padding(.horizontal, 15)
          .overlay(
              Capsule(style: .circular)
                          .stroke(LinearGradient(gradient: Gradient(colors: [Color("lightPink"), Color("lightRed")]), startPoint: .leading, endPoint: .trailing), style: StrokeStyle(lineWidth: 3))
          )
  }
}

struct TopicDesign: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(2)
            .background(LinearGradient(gradient: Gradient(colors: [Color("lightPink"), Color("lightRed")]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(20)
            .modifier(ShadowModifier())
    }
}

//MARK: - BUTTON NEXT MODIFIER
struct ButtonNextEnable: ViewModifier {
  func body(content: Content) -> some View {
    content
          .frame(maxWidth: .infinity, minHeight: 55)
          .background(LinearGradient(gradient: Gradient(colors: [Color("lightPink"), Color("lightRed")]), startPoint: .leading, endPoint: .trailing))
          .tint(.white)
          .clipShape(Capsule())
          .font(.system(size: 25, weight: .bold, design: .default))
          .modifier(ShadowModifier())
  }
}

struct ButtonNextDisable: ViewModifier {
  func body(content: Content) -> some View {
    content
          .frame(maxWidth: .infinity, minHeight: 55)
          .background(Color("regularGrey"))
          .tint(.gray)
          .clipShape(Capsule())
          .font(.system(size: 25, weight: .bold, design: .default))
  }
}

//MARK: - OUTLINE BUTTON OF SIGN UP GROUP VIEW
struct OutlineButtonEnable: ViewModifier {
  func body(content: Content) -> some View {
    content
          .frame(maxWidth: .infinity, minHeight: 55)
          .foregroundColor(Color("lightRed"))
          .font(.system(size: 25, weight: .bold, design: .default))
          .overlay(
              Capsule(style: .circular)
                          .stroke(LinearGradient(gradient: Gradient(colors: [Color("lightPink"), Color("lightRed")]), startPoint: .leading, endPoint: .trailing), style: StrokeStyle(lineWidth: 3))
          )
  }
}

struct OutlineButtonDisable: ViewModifier {
  func body(content: Content) -> some View {
    content
          .frame(maxWidth: .infinity, minHeight: 55)
          .foregroundColor(.gray)
          .font(.system(size: 25, weight: .bold, design: .default))
          .overlay(
              Capsule(style: .circular)
                  .stroke(Color.gray, style: StrokeStyle(lineWidth: 3))
          )
  }
}

struct ImageModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
          .aspectRatio(contentMode: .fill)
          .scaledToFill()
          .cornerRadius(20.0)
  }
}

struct AddImageButtonModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
          .frame(width: 40, height: 40)
          .padding(.leading, 5)
  }
}
