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
    //Binding은 부모 뷰 자식뷰 양방향 바인딩. 부모에서 자식으로 데이터를 전달하면 자식 뷰에서 해당 데이터를 수정하면 부모뷰에 반영된다~~
    //PageView에서 currentPage를 전달 받음
    @Binding var currentPage: Int
    
    //make 전에 호출해서 뷰 컨트롤러 구성할 때 코디네이터 객체를 담아준다.
    func makeCoordinator() -> Coordinator {
        //Coordinator가 생성될때마다 pageViewController의 인스턴스를 받아 참조를 유지하게 된다.
        Coordinator(pageViewControler: self)
    }
    
    //SwiftUI에서는 뷰를 표시할 준비가 되면 이 메서드를 한 번 호출한 다음 뷰 컨트롤러의 수명 주기를 관리합니다.
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(
            //페이지 전환 애니메이션 스타일, 페이지 레이아웃 방향
            transitionStyle: .scroll,
            navigationOrientation: .horizontal)

        pageViewController.dataSource = context.coordinator
        pageViewController.delegate = context.coordinator
        
        return pageViewController
    }
    
    
    //새로운 페이지가 선택될 때마다 호출되며, 현재 페이지를 업데이트합니다.
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers(
            //컨트롤러에 swiftui 뷰를 삽입하는 방법 - setViewControllers
            [context.coordinator.controllers[currentPage]], direction: .forward, animated: true)
        
    }

    //Coordinator는 UIKit과 SwiftUI 간의 통신을 돕기 위한 클래스입니다.
    class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
        var parent: PageViewController
        
        var controllers = [UIViewController]() // UIViewController 담는 빈 배열 생성!
        
        //Coordinator 생성
        init(pageViewControler: PageViewController){
            parent = pageViewControler
            //controller에 view들을 담아줘야해서 UIHostingController로 전부 래핑
            controllers = parent.pages.map { UIHostingController(rootView: $0) }

        }
        
        //두 메소드는 view와 컨트롤러 간의 관계를 설정한다. -> 컨트롤러를 앞뒤로 스와이프할 수 있도록 하기 위해
        //UIPageViewControllerDataSource프로토콜의 필수 메서드
        func pageViewController(
                _ pageViewController: UIPageViewController,
                viewControllerBefore viewController: UIViewController) -> UIViewController?
            {                                           //현재 컨트롤러를 controllers에서 찾아서 index 반환
                guard let index = controllers.firstIndex(of: viewController) else {
                    return nil
                }
                if index == 0 {//현재 페이지가 첫번째 페이지면
                    return controllers.last //이전페이지는 마지막 페이지 반환
                }
                return controllers[index - 1]//index - 1
            }
        //UIPageViewControllerDataSource프로토콜의 필수 메서드
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?
            {
                guard let index = controllers.firstIndex(of: viewController) else{
                    return nil
                }
                if index + 1 == controllers.count{ //마지막페이지면
                    return controllers.first // 이후 페이지는 첫페이지 반환
                }
                return controllers[index + 1]// index + 1
            }
        
        //페이지 넘김 애니메이션이 끝나고 호출됨
        func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
            if completed,
               let visibleViewController = pageViewController.viewControllers?.first,
               let index = controllers.firstIndex(of: visibleViewController){
                //currentPage에 index를 바인딩으로 넘겨준다
                parent.currentPage = index
            }
        }
    }
    
}

