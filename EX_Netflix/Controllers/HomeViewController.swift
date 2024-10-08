//
//  HomeViewController.swift
//  EX_Netflix
//
//  Created by 유영웅 on 8/22/24.
//

import UIKit

class HomeViewController: UIViewController{
    
    let sectionTitle:[String] = ["추천 영화","인기 작품","추천 시리즈","예정 작품","인기 순위"]
    var images:[UIImage] = []
    
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
        
        
        let headerView = HeroHeaderUIView(frame: CGRect(origin: .zero, size: CGSize(width: view.bounds.width, height: 500)))
        homeFeedTable.tableHeaderView = headerView
        
        getWork()
    }
    
    private func configurationNavigationBar(){
        var image = UIImage(named:"netflix")
        image = image?.resize(size: CGSize(width: 30, height: 30))
        image = image?.withRenderingMode(.alwaysOriginal)
        
        navigationController?.navigationBar.tintColor = .label
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .done, target: self, action: nil)
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: self, action: nil),
            UIBarButtonItem(image: UIImage(systemName: "play.rectangle"), style: .done, target: self, action: nil)
        ]
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        configurationNavigationBar()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        view.bounds.size.height -= (tabBarHieght*2)
        homeFeedTable.frame = view.bounds
        
    }
    private func getWork(){
        APICaller.shaerd.getTrend { result in
            switch result{
            case .success(let work):
                let posters =  work.data?.popularRecommendationMovie?.results.compactMap{ URL(string: "https://image.tmdb.org/t/p/original\($0.posterPath ?? "")") }
                guard let posters else {return}
//                self.images = posters.map{$0.load}
                print(self.images)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
 
extension HomeViewController: UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        //섹션 개수
        return sectionTitle.count
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
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let defaultOffset = view.safeAreaInsets.top
        let offset = scrollView.contentOffset.y + defaultOffset
        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0,-offset))
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitle[section]
    }
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else {return}
        header.textLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x + 20, y: header.bounds.origin.y, width: 100, height: header.bounds.height)
        header.textLabel?.textColor = .label
    }
}

#Preview{
    HomeViewController()
}

