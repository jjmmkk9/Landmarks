//
//  ContentView.swift
//  WatchLandmarks Watch App
//
//  Created by 비긴어브랜드 on 1/29/24.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    var body: some View {
        LandmarkList()
            .task {
                //notification center에서 알림을 사용하도록 승인 요청
                let center = UNUserNotificationCenter.current()
                _ = try? await center.requestAuthorization(
                    options: [.alert, .sound, .badge]
                )
            }
    }
}

#Preview {
    /*LandmarkList에서 @Environment(ModelData.self) var modelData
    사용하기 때문에 contentView에서 modelData를 사용하지 않지만 설정해줘야한다.*/
    ContentView()
        .environment(ModelData())
}
