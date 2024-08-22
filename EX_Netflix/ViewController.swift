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
        let view1 = UIView(frame: CGRect(x: 30, y: 30, width: 100, height: 100))
        view1.backgroundColor = .red
        self.view.addSubview(view1)
        print("뷰 업로드됨")
        // Do any additional setup after loading the view.
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
