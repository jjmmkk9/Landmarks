//
//  NotificationView.swift
//  WatchLandmarks Watch App
//
//  Created by 비긴어브랜드 on 1/29/24.
//

import SwiftUI

struct NotificationView: View {
    var title : String?
    var message : String?
    var landmark : Landmark?
    
    var body: some View {
        VStack{
            if let landmark{
                CircleImage(image: landmark.image.resizable())
                    .scaledToFit()
            }
            /*모든 알림 값은 0이 될 수 있으므로 데이터가 제공되지 않을 때는 알림 보기의 기본 미리 보기를 유지하는 것이 유용합니다. ?? 사용해서 기본 값으로 표시해주기~~ */
            Text(title ?? "Unknown Landmark")
                .font(.headline)
            
            Divider()
            
            Text(message ?? "You are within 5 miles of one of your favorite landmarks.")
                .font(.caption)
        }
    }
}

#Preview {
    NotificationView(
    title: "Turtle Rock",
    message: "You are within 5 miles of Turtle Rock.",
    landmark: ModelData().landmarks[0])

}
