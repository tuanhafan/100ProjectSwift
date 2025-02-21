//
//  CustomCellCollectionViewCell.swift
//  CollectionViewBasic
//
//  Created by AlexTran on 20/02/2025.
//

import UIKit

class CustomCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    static let identifier = "CustomCell"
    override func awakeFromNib() {
        super.awakeFromNib()
    }
     func configure(with nameImage:Int) {
         image.contentMode = .scaleAspectFill
         image.clipsToBounds = true
         image.image = UIImage(named: "\(nameImage)")
    }
    static func nib() -> UINib {
        return UINib(nibName: "CustomCell", bundle: nil)
    }
}
