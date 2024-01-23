//
//  ModelData.swift
//  Landmarks
//
//  Created by 비긴어브랜드 on 2024/01/19.
//

import Foundation

//Observable 클래스 만들기 전에는 그냥 어디서든 landmarks를 들고 다녔음...-> 이제 동적으로 데이터를 수정해야돼서 그런가??
@Observable
class ModelData{
    var landmarks : [Landmark] = load("landmarkData.json")
    var hikes : [Hike] = load("hikeData.json")
}

// create a generic function : 매개변수 T 는 Decodable 해야함
// 레이블 앞에 _를 추가하면 함수 호출 시 레이블을 생략할 수 있다. ex) load(filename: 4sdf) -> load(dgad)
func load<T:Decodable> (_ filename : String) -> T{
    
    let data: Data //byte buffer in memory
    
        //Bundle.main에 filename이 있으면 url을 반환하여 file변수 생성하여 저장
        //guard문은 옵셔널 바인딩(optional binding)을 사용하여 Bundle.main.url 메소드의 반환 값이 옵셔널인지 확인하고, 옵셔널이 해제될 때만 계속 진행하도록 되어 있습니다.
        //해당 파일의 URL을 반환합니다. 그러나 만약 파일을 찾지 못한다면 nil을 반환합니다. 따라서 이 메소드의 반환 값은 옵셔널 형태입니다.
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) //확장자는 고려하지 않도록 nil 전달해준다. 만약 txt 파일이 찾고싶으면 withExtension: "txt"
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
                //?) \(변수) 이렇게 출력 되나봄.
        }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)") //error에 발생한 에러내용도 담김
    }


    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data) //제네릭으로 받은 T의 원래 타입으로 data를 디코딩 : Landmark 타입으로 data를 디코딩해서 반환
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

//class Guard{
//    
//    func guardExample(_ testBool: Bool?) {
//        guard let bool = testBool, bool else {
//            print("참이 아니다.")
//            return
//        }
//        
//        print("result bool :: \(bool)")
//    }
//}
