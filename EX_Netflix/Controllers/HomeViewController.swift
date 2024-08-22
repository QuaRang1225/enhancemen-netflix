//
//  HomeViewController.swift
//  EX_Netflix
//
//  Created by 유영웅 on 8/22/24.
//

import UIKit

class HomeViewController: UIViewController{
    
    var tabBarHieght:CGFloat = .zero
    
    private var homeFeedTable:UITableView = {
        let table = UITableView(frame: .zero,style: .grouped)
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: "collectionViewTableViewCell")
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        view.addSubview(homeFeedTable)
        
        
        homeFeedTable.delegate = self
        homeFeedTable.dataSource = self
        
        homeFeedTable.tableHeaderView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: view.bounds.width, height: 450)))
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.bounds.size.height -= (tabBarHieght*2)
        homeFeedTable.frame = view.bounds
        
    }
}
 
extension HomeViewController: UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        //섹션 개수
        return 20
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //섹션 테이블 개수
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //테이블 아이템 뷰
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identidier, for: indexPath) as? CollectionViewTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //아이템 높이
        return 200
    }
}

#Preview{
    HomeViewController()
}
