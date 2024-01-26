//
//  FeatureCard.swift
//  Landmarks
//
//  Created by 비긴어브랜드 on 1/26/24.
//

import SwiftUI

struct FeatureCard: View {
    var landmark : Landmark
    
    var body: some View {
        //feature이미지 있으면 resizable로 가져오고 nil이면 아무것도 반환하지 않는다.
        landmark.featureImage?
                   .resizable()
                    //요소 위에 뭔가 씌우기
                   .overlay{
//                       Image(systemName: "square.and.arrow.up.circle.fill")
//                           .resizable()
//                           .foregroundColor(.yellow)
//                           .font(.title)
//                           .frame(width: 100, height: 100)
                        TextOverlay(landmark: landmark)
                   }
    }
}

struct TextOverlay :View {
    var landmark : Landmark
    
    //그라데이션 만들기
    var gradient : LinearGradient {
        .linearGradient(
            //Color 배열
            Gradient(colors: [.black.opacity(0.6), .black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center
            )
    }
    
    var body: some View {
           ZStack(alignment: .bottomLeading) {
               gradient
               VStack(alignment: .leading) {
                   Text(landmark.name)
                       .font(.title)
                       .bold()
                   Text(landmark.park)
               }
               .padding()
               .foregroundStyle(.white)
           }
       }
}

#Preview {
    FeatureCard(landmark: ModelData().landmarks[0])
        .aspectRatio(3 / 2, contentMode: .fit) //가로 3 세로 2 비율로 이미지 맞추기
}
