//
//  CatgoryRow.swift
//  Landmarks
//
//  Created by 비긴어브랜드 on 1/24/24.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName : String
    var items : [Landmark]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal) {
                HStack(alignment:.top, spacing: 0){
                    ForEach(items) { item in
                        NavigationLink{
                            LandmarkDetail(landmark: item)
                        }label: {
                            CategoryItem(landmark:item)
                        }
                    }
                }
            }.frame(height: 185)
        }
    }
}

#Preview {
    let landmarks = ModelData().landmarks
       return CategoryRow(
           categoryName: landmarks[0].category.rawValue,
           items: Array(landmarks.prefix(4))
           )
}
