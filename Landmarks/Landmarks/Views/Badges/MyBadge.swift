//
//  MyBadge.swift
//  Landmarks
//
//  Created by 비긴어브랜드 on 1/22/24.
//

import SwiftUI

struct MyBadge: View {
    var body: some View {
        Path{ path in
            path.move(to: CGPoint(x: 100, y: 100))
            
            path.addLine(to: CGPoint(x: 100, y: 200))
            
            path.addLine(to: CGPoint(x: 200, y: 200))
            path.addLine(to: CGPoint(x: 200, y: 100))
            path.closeSubpath()
//            path.addLine(to: CGPoint(x: 100, y: 100))
            
        }
        .fill(Color.black)
    }
}

#Preview {
    MyBadge()
}
