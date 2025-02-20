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
         image.backgroundColor = UIColor.random()
    }
    static func nib() -> UINib {
        return UINib(nibName: "CustomCell", bundle: nil)
    }
}
extension UIColor {
    static func random() -> UIColor {
        return UIColor(red: CGFloat.random(in:0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in:0...1), alpha: 1.0)
    }
}
