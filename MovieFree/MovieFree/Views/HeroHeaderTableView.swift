//
//  HeroHeaderView.swift
//  TixAura
//
//  Created by Alex Tran on 10/5/25.
//

import UIKit

class HeroHeaderTableView: UIView {
    
    private   let heroImage : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 15
        imageView.image = UIImage(named: "cat")
        return imageView
    }()
    
    private let viewContent: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private  let playButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("  Phát", for: .normal)
        button.setImage(UIImage(systemName: "play.fill"), for: .normal)
        button.tintColor = .black
        button.backgroundColor = .white
        button.layer.cornerRadius = 5
        button.titleLabel?.font = .systemFont(ofSize: 13, weight: .medium)
        
        return button
    }()
    
    private let addButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("  Danh sách của tôi", for: .normal)
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = .white
        button.backgroundColor = .gray
        button.layer.cornerRadius = 5
        button.titleLabel?.font = .systemFont(ofSize: 13)
        
        return button
    }()
    private let bottomStackView : UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .horizontal
        stackview.distribution = .fillEqually
        stackview.spacing = 15.0
        stackview.translatesAutoresizingMaskIntoConstraints = false
        return stackview
    }()
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        heroImage.frame = viewContent.bounds
    }
    
    func setup() {
        
        bottomStackView.addArrangedSubview(playButton)
        bottomStackView.addArrangedSubview(addButton)
        viewContent.addSubview(heroImage)
        viewContent.addSubview(bottomStackView)
        addSubview(viewContent)
        
        
        NSLayoutConstraint.activate([
            viewContent.topAnchor.constraint(equalTo: self.topAnchor, constant: 35),
            viewContent.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            viewContent.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            viewContent.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 5),
            
            bottomStackView.trailingAnchor.constraint(equalTo: viewContent.trailingAnchor, constant: -15),
            bottomStackView.leadingAnchor.constraint(equalTo: viewContent.leadingAnchor, constant: 15),
            bottomStackView.bottomAnchor.constraint(equalTo: viewContent.bottomAnchor, constant: -15),
            bottomStackView.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
    
    
}
