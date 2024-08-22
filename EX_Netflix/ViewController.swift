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

class ViewController1: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let view1 = UIView(frame: CGRect(x: 130, y: 130, width: 100, height: 100))
        view1.backgroundColor = .blue
        self.view.addSubview(view1)
        print("뷰 업로드됨1")
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        print("뷰 나타날 예정1")
    }
    override func viewIsAppearing(_ animated: Bool) {
        print("뷰 나타나는 중1")
    }
    override func viewDidDisappear(_ animated: Bool) {
        print("뷰 닫힘1")
    }
    override func viewWillDisappear(_ animated: Bool) {
        print("뷰 닫힐 예정1")
    }
    override func viewDidAppear(_ animated: Bool) {
        print("뷰 나타남1")
    }
    override func viewWillLayoutSubviews() {
        //앱이 백그라운드 진입 시 레이아웃 정보가 바뀌는 듯함
        print("레이아웃 구성 예정1")
    }
    override func viewDidLayoutSubviews() {
        print("레이아웃 구성 완료1")
    }
}
