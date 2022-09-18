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

import Lottie
import SwiftUI
import UIKit

struct AnimationLoadingLogoView: UIViewRepresentable {
    var nameAnimate: String
    typealias UIViewType = UIView
    func makeUIView(context: UIViewRepresentableContext<AnimationLoadingLogoView>) -> UIView {
        let view = UIView(frame: .zero)
        
        //MARK: ADD ANIMATION
        let animationView = AnimationView()
        animationView.animation = Animation.named(nameAnimate)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
        view.addSubview(animationView)
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
        
        return view
    }
    func updateUIView(_ uiView: UIView, context: Context) {
        //MARK: DO NOTHING
    }
}

