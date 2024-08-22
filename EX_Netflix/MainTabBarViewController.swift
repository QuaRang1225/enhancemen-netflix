//
//  ViewController.swift
//  EX_Netflix
//
//  Created by 유영웅 on 8/21/24.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: UpcomingViewController())
        let vc3 = UINavigationController(rootViewController: SearchViewController())
        let vc4 = UINavigationController(rootViewController: DownloadsViewController())
        
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc2.tabBarItem.image = UIImage(systemName: "play.circle")
        vc3.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        vc4.tabBarItem.image = UIImage(systemName: "arrow.down.to.line")
        
        vc1.title = "홈"
        vc2.title = "출시 예정"
        vc3.title = "검색"
        vc4.title = "다운로드"
        
        setViewControllers([vc1,vc2,vc3,vc4], animated: true)
    }
    
}





// - 생명주기 관련
extension MainTabBarViewController{
    
    override func viewWillAppear(_ animated: Bool) {
        print("뷰 나타날 예정")
    }
    override func viewIsAppearing(_ animated: Bool) {
        print("뷰 나타나는 중")
    }
    override func viewDidDisappear(_ animated: Bool) {
        print("뷰 닫힘")
    }
    override func viewWillDisappear(_ animated: Bool) {
        print("뷰 닫힐 예정")
    }
    override func viewDidAppear(_ animated: Bool) {
        print("뷰 나타남")
    }
    override func viewWillLayoutSubviews() {
        print("레이아웃 구성 예정")
    }
    override func viewDidLayoutSubviews() {
        print("레이아웃 구성 완료")
    }
}
