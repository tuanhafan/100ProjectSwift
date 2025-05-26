//
//  CustomHomeCollectionViewCell.swift
//  TixAura
//
//  Created by Alex Tran on 14/5/25.
//

import UIKit
import SDWebImage

class CustomHomeCollectionViewCell: UICollectionViewCell {
    static let identifier = "CustomHomeCollectionViewCell"
    
    let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(posterImageView)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        posterImageView.frame = contentView.bounds
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    
    public func configure(with urlImage: String) {
        
        guard let url = URL(string: "\(apiImage)/w500/\(urlImage)") else {
            return
        }
        posterImageView.sd_setImage(with: url, completed: nil)
    }
}


    

