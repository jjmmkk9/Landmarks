//
//  LandmarkDetail.swift
//  WatchLandmarks Watch App
//
//  Created by 비긴어브랜드 on 1/29/24.
//

import SwiftUI
//large watch와 small watch 모드로 교차 테스트하여 앱이 디스플레이에 맞게 얼마나 잘 확장되는지 확인할 수 있습니다. 항상 그렇듯이 지원되는 모든 기기 크기에서 사용자 인터페이스를 테스트해야 합니다.
struct LandmarkDetail: View {
    @Environment(ModelData.self) var modelData
    var landmark: Landmark


    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
        @Bindable var modelData = modelData
        //스크롤뷰만 하면 circleImage 졸라 커짐
        ScrollView {
            VStack {
                CircleImage(image: landmark.image.resizable())
                    .scaledToFit()
                Text(landmark.name)
                    .font(.headline)
                    .lineLimit(0)
                Toggle(isOn: $modelData.landmarks[landmarkIndex].isFavorite){
                    Text("Favorite")
                }
                
                Divider()
                
                Text(landmark.park)
                    .font(.caption)
                    .bold()
                    .lineLimit(0)
                
                Text(landmark.state)
                    .font(.caption)
                
                Divider()
                
                MapView(coordinate: landmark.LocationCoordinate)
                    .scaledToFit()
                
            }
            .padding(.top, -55)
            .padding(15)
        }
        .navigationTitle("Landmarks")
    }
}

#Preview {
    let modelData = ModelData()
    return LandmarkDetail(landmark: modelData.landmarks[0])
        .environment(modelData)
}
