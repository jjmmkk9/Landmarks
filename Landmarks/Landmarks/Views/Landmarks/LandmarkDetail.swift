//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by 비긴어브랜드 on 2024/01/19.
//

import SwiftUI

struct LandmarkDetail: View {
    //body 이전은 initializer 인가보다
    @Environment(ModelData.self) var modelData
    var landmark : Landmark
    
    var landmarkIndex: Int {
            modelData.landmarks.firstIndex(where: { $0.id == landmark.id })! //강제 언래핑(!)
        }
    
    var body: some View {
        @Bindable var modelData = modelData
        
        ScrollView {
            //You can use a stack to return multiple views from a body property.
            VStack {
                MapView(coordinate: landmark.LocationCoordinate)
                    .frame(height: 300)
                
                CircleImage(image: landmark.image)
                    .offset(y:-130)
                    .padding(.bottom, -130)
                VStack (alignment:.leading){
                    HStack {
                        Text(landmark.name)
                            .font(.title)
                        FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                    }
                    HStack{
                        Text(landmark.park)
                        
                        Spacer()//컨텐츠에 의해서 크기가 정의되는 것이 아니라 상위 뷰의 모든 공간을 사용한다
                        
                        Text(landmark.state)
                    }
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    
                    Divider()
                    
                    Text("About " + landmark.name)
                        .font(.title2)
                    Text(landmark.description)
                }
                .padding()
            }
            //뷰가 네비게이션 스택의 일부인 경우에만 적용된다.(여기 프리뷰에서는 안보임)
            .navigationTitle(landmark.name)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    let modelData = ModelData()
        return LandmarkDetail(landmark: modelData.landmarks[0])
            .environment(modelData)
}
