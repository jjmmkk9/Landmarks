//
//  LandmarkList.swift
//  Landmarks
//
//  Created by 비긴어브랜드 on 2024/01/19.
//

import SwiftUI

struct LandmarkList: View {
    //@래퍼를 사용하면 현재 뷰의 모델 데이터를 읽을 수 있습니다.
    @Environment(ModelData.self) var modelData
//    var modelData = ModelData() //@Environment없으니 안됨
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [Landmark] {
                        //landmark in 하는 대신 $0으로 간결하게 표시가능
        modelData.landmarks.filter {(!showFavoritesOnly || $0.isFavorite)}
       }
    var body: some View {
    
        NavigationSplitView {
            //Key Path 문법 : landmarks 배열의 각 요소에서 id 프로퍼티를 추출
            //List(landmarks, id: \.id)
            //Landmark에 Identifiable 프로토콜 달아줬기 때문에 이제 저 id 파라미터는 필요 없어!!!
            List {       //$을 사용해야 Binding<Bool>으로 넘길수 있음
                Toggle(isOn: $showFavoritesOnly){
                    Text("Favorites only")
                }
                ForEach(filteredLandmarks) {landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    //label은 navigationLink에 표시될 내용
                    } label: {
                        LandmarkRow(landmark: landmark)
                        }
                    }
                }
            .animation(.default, value: filteredLandmarks)
            .navigationTitle("Landmarks")
            
            //detail은 아이폰에서는 안보이고 ipad에서 보이나봄
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    LandmarkList()
        .environment(ModelData())
}
