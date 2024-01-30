//
//  PageView.swift
//  Landmarks
//
//  Created by 비긴어브랜드 on 1/26/24.
//
import SwiftUI

struct PageView<Page: View>: View {
    var pages: [Page]
    @State private var currentPage = 0
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            PageViewController(pages: pages, currentPage: $currentPage)
            PageControl(numberOfPages: pages.count,
                        currentPage: $currentPage)
            .frame(width: CGFloat(pages.count * 18))
            .padding(.trailing, 10)
        }
        .aspectRatio(3 / 2, contentMode: .fit)
    }
}

#Preview {
    
    PageView(pages: ModelData().features.map {feature in
        FeatureCard(landmark: feature) })
    
    
}
