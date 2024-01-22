//
//  Badge.swift
//  Landmarks
//
//  Created by 비긴어브랜드 on 1/22/24.
//

import SwiftUI

struct Badge: View {
    var badgeSymbols : some View{
        //8개 반복
        ForEach(0..<8) { index in
            RotatedBadgeSymbol(angle: .degrees(Double(index) / Double(8)) * 360.0
                                            // 1번째: (0/8) * 360
                                            // 2번째: (1/8) * 360 = 45
                                            // 3번째: (2/8) * 360 = 90 ...
            )
        }
        .opacity(0.5)
    }
    
    var body: some View {
        ZStack {
            BadgeBackground()
            GeometryReader { viewInfo in
                badgeSymbols//크기 1/4
                    .scaleEffect(1.0 / 4.0, anchor: .top)
                    .position(x: viewInfo.size.width / 2.0, y : (3.0 / 4.0) * viewInfo.size.height)
            }
        }
        .scaledToFit()
    }
}

#Preview {
    Badge()
}
