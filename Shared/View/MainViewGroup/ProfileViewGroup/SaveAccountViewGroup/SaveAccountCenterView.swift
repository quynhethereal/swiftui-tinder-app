//
//  SaveAccountCenterView.swift
//  Tinder-FE
//
//  Created by Gia Huy on 10/09/2022.
//

import SwiftUI

struct SaveAccountCenterView: View {
    @State var isGoToGuideView: Bool = true
    @State var isGoToToolView: Bool = false
    @State var isGoToResourceView: Bool = false
    var body: some View {
        ZStack {
            if isGoToGuideView == true {
                
                GuideView(guideActive: $isGoToGuideView, toolActive: $isGoToToolView, rescActive: $isGoToResourceView)
                
            } else if isGoToToolView == true {
                
                ToolProfileView(guideActive: $isGoToGuideView, toolActive: $isGoToToolView, rescActive: $isGoToResourceView)
                
            } else if isGoToResourceView == true {
                
                ResourcesProfileView(guideActive: $isGoToGuideView, toolActive: $isGoToToolView, rescActive: $isGoToResourceView)
            }
        }
    }
}

struct SaveAccountCenterView_Previews: PreviewProvider {
    static var previews: some View {
        SaveAccountCenterView()
    }
}
