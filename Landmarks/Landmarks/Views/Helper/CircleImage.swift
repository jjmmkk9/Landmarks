//
//  CircleImage.swift
//  Landmarks
//
//  Created by 비긴어브랜드 on 2024/01/18.
//

import SwiftUI

struct CircleImage: View {
    var image : Image
    
    var body: some View {
        image
            .clipShape(Circle())
            .overlay{
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)

    }
}

#Preview {
    CircleImage(image: Image("turtlerock"))
}
