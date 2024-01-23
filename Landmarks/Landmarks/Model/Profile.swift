//
//  Profile.swift
//  Landmarks
//
//  Created by 조문기 on 1/22/24.
//

import Foundation
struct Profile {
    var username: String
    var prefersNotifications = true
    var seasonalPhoto = Season.winter
    var goalDate = Date()


    static let `default` = Profile(username: "mungi")

    
    enum Season: String, CaseIterable, Identifiable {
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"
        
        //Identifiable 프로토콜을 채택하기 위해 필요한 id 구현하는 부분
        var id: String { rawValue }
    }
}
