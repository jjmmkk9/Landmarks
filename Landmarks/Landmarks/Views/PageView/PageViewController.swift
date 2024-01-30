//
//  PageViewController.swift
//  Landmarks
//
//  Created by 비긴어브랜드 on 1/26/24.
//

import SwiftUI
import UIKit

struct PageViewController<Page: View>: UIViewControllerRepresentable {

    var pages: [Page]
    //Binding은 부모 뷰 자식뷰 양방향 바인딩 제공. 부모에서 자식으로 데이터를 전달하면 자식 뷰에서 해당 데이터를 수정하면 부모뷰에 반영된다~~
    @Binding var currentPage: Int
    
    //make 전에 얘를 호출해서 뷰 컨트롤러 구성할 때 코디네이터 객체에 액세스할 수 있게 한다.
    func makeCoordinator() -> Coordinator {
        //Coordinator가 생성될때마다 pageViewController의 인스턴스를 받아 참조를 유지하게 된다.
        Coordinator(self)
    }
    
    //SwiftUI에서는 뷰를 표시할 준비가 되면 이 메서드를 한 번 호출한 다음 뷰 컨트롤러의 수명 주기를 관리합니다.
    func makeUIViewController(context: Context) -> UIPageViewController {
        // pageViewController 생성
            let pageViewController = UIPageViewController(
                //페이지 전환 애니메이션 스타일
                transitionStyle: .scroll,
                //페이지 레이아웃 방향
                navigationOrientation: .horizontal)
        
        pageViewController.dataSource = context.coordinator
        pageViewController.delegate = context.coordinator

            return pageViewController
        }
    
    //새로운 페이지가 선택될 때마다 호출되며, 현재 페이지를 업데이트합니다.
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
            pageViewController.setViewControllers(
//                [UIHostingController(rootView: pages[0])], direction: .forward, animated: true)
                [context.coordinator.controllers[currentPage]], direction: .forward, animated: true)
        }

    //Coordinator는 UIKit과 SwiftUI 간의 통신을 돕기 위한 클래스입니다.
    class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
        var parent: PageViewController
        
        var controllers = [UIViewController]()
        
        //Coordinator 생성
        init(_ pageViewControler: PageViewController){
            parent = pageViewControler
            
            controllers = parent.pages.map { UIHostingController(rootView: $0) }
        }
        
        //이 두 메소드는 view와 컨트롤러 간의 관계를 설정하여 컨트롤러를 앞뒤로 스와이프할 수 있도록 합니다.
        //UIPageViewControllerDataSource프로토콜의 필수 메서드들 - before, after
        func pageViewController(
                    _ pageViewController: UIPageViewController,
                    viewControllerBefore viewController: UIViewController) -> UIViewController?
                {
                    guard let index = controllers.firstIndex(of: viewController) else {
                        return nil
                    }
                    if index == 0 {//현재 페이지가 첫번째 페이지면
                        //마지막 컨트롤러를 반환
                        return controllers.last
                    }
                    return controllers[index - 1]
                }


                func pageViewController(
                    _ pageViewController: UIPageViewController,
                    viewControllerAfter viewController: UIViewController) -> UIViewController?
                {
                    guard let index = controllers.firstIndex(of: viewController) else {
                        return nil
                    }
                    if index + 1 == controllers.count {
                        return controllers.first
                    }
                    return controllers[index + 1]
                }
        
                func pageViewController(
                            _ pageViewController: UIPageViewController,
                            didFinishAnimating finished: Bool,
                            previousViewControllers: [UIViewController],
                            transitionCompleted completed: Bool) {
                            if completed,
                               let visibleViewController = pageViewController.viewControllers?.first,
                               let index = controllers.firstIndex(of: visibleViewController) {
                                parent.currentPage = index
                            }
                        }
    }
    
}

