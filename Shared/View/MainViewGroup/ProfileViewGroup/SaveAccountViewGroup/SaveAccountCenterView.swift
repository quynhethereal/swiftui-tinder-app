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

struct SaveAccountCenterView: View {
    @State var isGoToGuideView: Bool = true
    @State var isGoToToolView: Bool = false
    @State var isGoToResourceView: Bool = false
    @EnvironmentObject var mainViewModel : MainViewModel
    var body: some View {
        ZStack {
            if isGoToGuideView == true {
                
                GuideView(guideActive: $isGoToGuideView, toolActive: $isGoToToolView, rescActive: $isGoToResourceView).environmentObject(mainViewModel)
                
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
