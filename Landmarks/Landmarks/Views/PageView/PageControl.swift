//
//  PageControl.swift
//  Landmarks
//
//  Created by 조문기 on 1/28/24.
//

import SwiftUI
import UIKit

//UIViewRepresentable and UIViewControllerRepresentable types have the same life cycle, with methods
struct PageControl: UIViewRepresentable {
    var numberOfPages: Int
    @Binding var currentPage: Int
    
    func makeCoordinator() -> Coordinator {
        Coordinator(control: self)
    }
    
    //pageControl에 필요한 numberOfPages, currentPage를 각각 설정
    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = numberOfPages
        control.currentPage = 0
        
        //특정 UIControl의 특정 이벤트에 대한 동작을 coordinator의 메서드와 연결
        control.addTarget(
            context.coordinator,
            action: #selector(Coordinator.updateCurrentPage(sender:)), //수행할 메서드
            for: .valueChanged)
        control.currentPageIndicatorTintColor = UIColor.magenta
        
        return control
    }
    //뷰 업데이트 될때마다 currentPage를 옮겨줘야
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }

    
    class Coordinator: NSObject{
        var control: PageControl
        
        init(control: PageControl) {
            self.control = control
        }
        
        @objc
        func updateCurrentPage(sender: UIPageControl){
            control.currentPage = sender.currentPage
        }
    }
}


