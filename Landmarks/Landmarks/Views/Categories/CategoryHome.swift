//
//  CategoryHome.swift
//  Landmarks
//
//  Created by 비긴어브랜드 on 1/24/24.
//

import SwiftUI

struct CategoryHome: View {
    @Environment(ModelData.self) var modelData
    @State private var showingProfile = false
    
    var body: some View {
        NavigationSplitView{
            List{
                PageView(pages: modelData.features.map {FeatureCard(landmark: $0)})
                    .listRowInsets(EdgeInsets())
                ForEach(modelData.categories.keys.sorted(), id: \.self){key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)//categories에서 key인거 가져와서 unwrap!
                }
                .listRowInsets(EdgeInsets())
            }
            .listStyle(.inset)
                .navigationTitle("Featured")
            //toolbar
                .toolbar{
                    Button{
                        showingProfile.toggle()
                    }label: {
                        Label("User Profile", systemImage: "person.crop.circle")
                    }
                }
                .sheet(isPresented: $showingProfile, content: {
                    ProfileHost()
                        .environment(modelData)
                })
        }detail: {
            Text("Select a LAndmark")
        }
    }
}

#Preview {
    CategoryHome()
        .environment(ModelData())
}
