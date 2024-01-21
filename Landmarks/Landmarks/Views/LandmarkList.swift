//
//  LandmarkList.swift
//  Landmarks
//
//  Created by 비긴어브랜드 on 2024/01/19.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
    
        NavigationSplitView {
            //Key Path 문법 : landmarks 배열의 각 요소에서 id 프로퍼티를 추출
            //List(landmarks, id: \.id)
            //Landmark에 Identifiable 프로토콜 달아줬기 때문에 이제 저 id 파라미터는 필요 없어!!!
            List(landmarks) { landmark in
                            NavigationLink {
                                LandmarkDetail(landmark: landmark)
                                //label은 navigationLink에 표시될 내용
                            } label: {
                                LandmarkRow(landmark: landmark)
                            }
                        }
            .navigationTitle("Landmarks")
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    LandmarkList()
}
