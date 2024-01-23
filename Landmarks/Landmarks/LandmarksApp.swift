//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by 비긴어브랜드 on 2024/01/17.
//

import SwiftUI

@main
struct LandmarksApp: App {
//@main은 entry point : App프로토콜로 구성됨
    
    //Now that you’ve created the ModelData object, you need to update your views to adopt it as the data store for your app.
    //state = 중요한거니까 private
    @State private var modelData = ModelData()
    var body: some Scene {
        //body요소는 하나 이상의 Scene를 반환한다.
        WindowGroup {
            ContentView()
                .environment(modelData)
                
        }
    }
}
