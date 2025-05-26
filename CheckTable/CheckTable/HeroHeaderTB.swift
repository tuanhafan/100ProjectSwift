//
//  HeroHeaderTB.swift
//  CheckTable
//
//  Created by Alex Tran on 11/5/25.
//

import UIKit

class HeroHeaderTB: UIView {
 
        private let heroImage : UIImageView = {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            imageView.image = UIImage(named: "cat")
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()

        override init(frame:CGRect) {
            super.init(frame: frame)
            addSubview(heroImage)
            setupLayout()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func setupLayout() {
            NSLayoutConstraint.activate([
                heroImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
                heroImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
                heroImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
                heroImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 5),
            ])
        }
        
       
    }

