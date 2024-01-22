//
//  RotatedBadgeSymbol.swift
//  Landmarks
//
//  Created by 비긴어브랜드 on 1/22/24.
//

import SwiftUI

struct RotatedBadgeSymbol: View {
    let angle : Angle
    var body: some View {
        //view 안에 view 가져올때
        BadgeSymbol()
            .padding(-60)
            .rotationEffect(angle, anchor: .bottom)
    }
}

#Preview {
    RotatedBadgeSymbol(angle: Angle(degrees:0.5))
}
