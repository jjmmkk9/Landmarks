//
//  Landmark.swift
//  Landmarks
//
//  Created by 비긴어브랜드 on 2024/01/18.
//

import Foundation
import SwiftUI
import CoreLocation

//Codable은 Decodable, Encodable을 결합한 프로토콜
//Decodable: JSON이나 다른 인코딩된 형식에서 데이터를 디코딩할 수 있는 프로토콜입니다. : Json or more to-> any structure
//Encodable: 데이터를 JSON 또는 다른 형식으로 인코딩할 수 있는 프로토콜입니다.       : any structure to-> Json or more
struct Landmark: Hashable, Codable, Identifiable {
    var id : Int
    var name : String
    var state : String
    var park : String
    var description : String
    
    private var imageName : String //image로 변환할때만 쓰이기 때문에 private
    var image : Image {
        Image(imageName)
    }
    private var coordinates : Coordinates //LocationCoordinate로 변환할때만 쓰이기 때문에 private

    var LocationCoordinate : CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }
    
    struct Coordinates: Hashable, Codable {
        var longitude : Double
        var latitude : Double
    }
    //데이터가 이렇게 이쁘게 생겼기 때문에 Coordinates 구조체 따로 만들어서 안에 값들 가져오실게요.
    //"coordinates": {
    //"longitude": -116.166868,
    //"latitude": 34.011286
}
    


