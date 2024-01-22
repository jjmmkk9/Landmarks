//
//  BadgeBackground.swift
//  Landmarks
//
//  Created by 비긴어브랜드 on 1/22/24.
//

import SwiftUI

struct BadgeBackground: View {
    var body: some View {
        //GeometryReader는 부모 View의 크기 및 공간 정보에 접근할 수 있게 해줍니다. 코드에서 사용된 geometry 매개변수는 GeometryProxy 형태이며, 부모 View의 크기와 위치 정보 등을 제공
        GeometryReader { geometry in
            Path { path in
                //min(geometry.size.width, geometry.size.height)는 너비와 높이 중에서 더 작은 값, 즉 정사각형의 한 변의 길이를 나타냅니다.
                var width: CGFloat = min(geometry.size.width, geometry.size.height)
                let height = width
                let xScale: CGFloat = 0.832
                let xOffset = (width * (1.0 - xScale)) / 2.0
                width *= xScale
                
                path.move(
                    to: CGPoint(
                    x : width * 0.95 + xOffset,
                    y: height * (0.20 + HexagonParameters.adjustment)
                ))
                
                HexagonParameters.segments.forEach{segment in
                    //addLine(to:) 점을 그리고 점to점 연결
                    path.addLine(
                        to: CGPoint(
                            x: width * segment.line.x + xOffset,
                            y: height * segment.line.y
                        )
                    )
                    
                    path.addQuadCurve(
                        to: CGPoint(
                            x: width * segment.curve.x + xOffset,
                            y: height * segment.curve.y
                        ), 
                        control: CGPoint(
                            x: width * segment.control.x + xOffset,
                            y: height * segment.control.y
                        )
                    )
                }
            }
            .fill(.linearGradient(Gradient(colors: [Self.gradientStart, Self.gradientEnd]), startPoint: UnitPoint(x: 0.5, y: 0), endPoint: UnitPoint(x: 0.3, y: 0.6)))
        }
        .aspectRatio(1, contentMode: .fit)
    }
    //static 변수는 Self. 해서 사용해야한다.
    static let gradientStart = Color(red:239.0 / 255, green: 120.0 / 255, blue: 221.0 / 255)
    static let gradientEnd = Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255)
}

#Preview {
    BadgeBackground()
}
