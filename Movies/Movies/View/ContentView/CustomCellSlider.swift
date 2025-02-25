//
//  CustomcellSlider.swift
//  Movies
//
//  Created by AlexTran on 22/02/2025.
//

import UIKit

class CustomCellSlider: UICollectionViewCell {
    
    @IBOutlet weak var imageSlider:UIImageView!
   
    static let identifer = "sliderCell"
    
    override func awakeFromNib(){
        super.awakeFromNib()
        
    }
     func configure(with nameImage:String) {
        imageSlider.contentMode = .scaleAspectFill
        imageSlider.clipsToBounds = true
        imageSlider.image = UIImage(named: "\(nameImage)")
    }
    static func nib() -> UINib {
        return UINib(nibName: "CustomCellSlider", bundle: nil)
    }
}

