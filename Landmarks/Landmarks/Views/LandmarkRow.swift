//
//  LandmarksRow.swift
//  Landmarks
//
//  Created by 비긴어브랜드 on 2024/01/19.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark : Landmark //생성할때 넣어줄것은 body 밖에 정의해줘~
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            
            Spacer()
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }

    }
}

//#preview("프리뷰이름") LandmarksRow(landmark : landmarks[0] 프리뷰를 여러개 만들어서 0,1,2 등 넣어서 확인 할 수 있다.
#Preview() {
    //Group을 사용하여 여러 뷰를 그룹화하면 각 뷰 사이에 기본적으로 간격이 생긴다. SwiftUI에서는 뷰를 그룹으로 묶을 때 간격을 설정할 수 있는데, 이 값이 기본적으로 설정되어 있다.
    Group {
        LandmarkRow(landmark: landmarks[0])
        LandmarkRow(landmark: landmarks[1])
    }
    
}
