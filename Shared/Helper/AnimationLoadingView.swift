//
//  AnimationLoadingView.swift
//  Tinder-FE
//
//  Created by Gia Huy on 11/09/2022.
//

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

