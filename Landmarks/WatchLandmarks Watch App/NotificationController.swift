//
//  NotificationController.swift
//  WatchLandmarks Watch App
//
//  Created by 비긴어브랜드 on 1/29/24.
//

import SwiftUI
import WatchKit
import UserNotifications

class NotificationController: WKUserNotificationHostingController<NotificationView> {
    var landmark: Landmark?
    var title: String?
    var message: String?
    //키를 이용해 랜드마크 인덱스를 추출할거라는데 어떻게?
    let landmarkIndexKey = "landmarkIndex"
    
    
    //body() 앞서 만든 Notification View를 인스턴스화 한다.
    override var body: NotificationView{
        NotificationView(
        title: title,
        message: message,
        landmark: landmark
        )
    }
  //이 메서드 호출하면 시스템이 컨트롤러의 본문 속성을 무효화하여 알림 보기를 업데이트한다. 그러면 시스템이 watch에 알림을 표시한다. = 컨트롤러의 속성을 업데이트한다.
    override func didReceive(_ notification: UNNotification) {
        let modelData = ModelData()
        
        //알림에서 전달된 정보는 UNNotification에서 request 프로퍼티의 content에서 가져온다. 이 정보는 userInfo라는 딕셔너리 형태로 저장되어있다.
        // userInfo에 푸시의 데이터가 다 들어 있어서 얘를 사용해준다.
        let notificationData =
        notification.request.content.userInfo as? [String: Any]
        
        /*as?는 이 연산자는 특정 타입으로의 캐스팅을 시도하며, 실패할 경우 nil을 반환합니다. 따라서 as?를 사용하면 안전하게 캐스팅을 시도하고, 캐스팅이 실패해도 앱이 크래시되지 않습니다.*/
        //notificationData? -> 옵셔널체이닝
        //as? -> 타입캐스팅
        let aps = notificationData?["aps"] as? [String: Any]
        let alert = aps?["alert"] as? [String: Any]
        
        title = alert?["title"] as? String
        message = alert?["body"] as? String
        
        if let index = notificationData?[landmarkIndexKey] as? Int{
            landmark = modelData.landmarks[index]
        }
    }
}

