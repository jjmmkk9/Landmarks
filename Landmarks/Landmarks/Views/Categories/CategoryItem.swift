//
//  CategoryItem.swift
//  Landmarks
//
//  Created by 비긴어브랜드 on 1/24/24.
//

import SwiftUI

struct CategoryItem: View {
    var landmark : Landmark
    
    var body: some View {
//        Image(landmark.image) 이미 landmark.image가 Image라서
        VStack(alignment:.leading) {
            landmark.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
            .cornerRadius(5)
            
            Text(landmark.name)
                .foregroundStyle(.primary)
                .font(.caption)
                .padding(3)
        }
        .padding(.leading, 15)
        
    }
}

#Preview {
    CategoryItem(landmark: ModelData().landmarks[0])
}
