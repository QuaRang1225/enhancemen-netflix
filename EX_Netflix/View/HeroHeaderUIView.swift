//
//  HeroHeaderUIView.swift
//  EX_Netflix
//
//  Created by 유영웅 on 8/22/24.
//

import UIKit

class HeroHeaderUIView: UIView {

    private let playButton:UIButton = {
        let button = UIButton()
        button.setTitle("재생", for: .normal)
        button.layer.cornerRadius = 5
        button.layer.borderColor = UIColor.label.cgColor
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let title:UILabel = {
       let title = UILabel()
        title.text = "하이큐"
        title.textColor = .label
        title.font = .systemFont(ofSize: 35,weight: .black)
        return title
    }()
    private let downloadButton:UIButton = {
        let button = UIButton()
        button.setTitle("다운로드", for: .normal)
        button.setTitleColor(.systemBackground, for: .normal)
        button.layer.cornerRadius = 5
        button.layer.backgroundColor = UIColor.label.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let heroImageView:UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "Haikyuu")
        return imageView
    }()
    
    private func addGradient()->CAGradientLayer{
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.systemBackground.cgColor
        ]
        gradientLayer.frame = bounds
        return gradientLayer
        
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(heroImageView)
        layer.addSublayer(addGradient())
        
        applyConstraints()
    }
    private func applyConstraints(){
        
        let hstackView = UIStackView(arrangedSubviews: [playButton, downloadButton])
        hstackView.axis = .horizontal
        hstackView.spacing = 10
        hstackView.distribution = .fillEqually
        
        let vstackView = UIStackView(arrangedSubviews: [title, hstackView])
        vstackView.axis = .vertical
        vstackView.spacing = 20
        vstackView.distribution = .fillEqually
        
        hstackView.translatesAutoresizingMaskIntoConstraints = false
        vstackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(vstackView)
        
        NSLayoutConstraint.activate([
            vstackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            vstackView.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -15),
            vstackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            vstackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            hstackView.heightAnchor.constraint(equalToConstant: 40)
           ])
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        heroImageView.frame = bounds
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
}

#Preview{
    HeroHeaderUIView()
}
