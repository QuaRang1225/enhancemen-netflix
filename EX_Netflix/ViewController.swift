//
//  ViewController.swift
//  EX_Netflix
//
//  Created by 유영웅 on 8/21/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

// - 생명주기 관련
extension ViewController{
    
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
