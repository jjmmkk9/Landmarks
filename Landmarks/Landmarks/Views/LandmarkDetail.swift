//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by 비긴어브랜드 on 2024/01/19.
//

import SwiftUI

struct LandmarkDetail: View {
    var landmark : Landmark
    var body: some View {
        ScrollView {
            //You can use a stack to return multiple views from a body property.
            VStack {
                MapView(coordinate: landmark.LocationCoordinate)
                    .frame(height: 300)
                
                CircleImage(image: landmark.image)
                    .offset(y:-130)
                    .padding(.bottom, -130)
                VStack (alignment: .leading){
                    Text(landmark.name)
                        .font(.title)
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
    LandmarkDetail(landmark: landmarks[0])
}
