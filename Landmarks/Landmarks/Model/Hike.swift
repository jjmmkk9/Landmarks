//
//  Hike.swift
//  Landmarks
//
//  Created by 조문기 on 1/23/24.
//

import Foundation

struct Hike: Codable, Hashable, Identifiable {
    var id: Int
    var name: String
    var distance: Double
    var difficulty: Int
    var observations: [Observation]


    static var formatter = LengthFormatter()


    var distanceText: String {
        Hike.formatter
            .string(fromValue: distance, unit: .kilometer)
    }

//해시값을 생성할 수 있는 타입을 선언하기 위한 프로토콜입니다.
//해시값은 일반적으로 해당 객체를 고유하게 식별하는 데 사용되며, 집합(Set)이나 딕셔너리(Dictionary) 등과 같은 자료구조에서 효율적으로 객체를 검색
    struct Observation: Codable, Hashable {
        var distanceFromStart: Double

        var elevation: Range<Double>
        var pace: Range<Double>
        var heartRate: Range<Double>
        
        // "heartRate":[
        // 117.16351898665887,
        // 121.95815455919609
        // ]
    }
}
