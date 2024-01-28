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
    //pageControl에 필요한 numberOfPages, currentPage를 각각 설정
    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = numberOfPages
        control.currentPage = currentPage
        
        return control
    }
    //뷰 업데이트 될때마다 currentPage를 옮겨줘야
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }
}


