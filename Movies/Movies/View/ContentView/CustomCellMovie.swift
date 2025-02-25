//
//  CustomCellMovie.swift
//  Movies
//
//  Created by AlexTran on 22/02/2025.
//

import UIKit

class CustomCellMovie: UICollectionViewCell {
    @IBOutlet weak var avatar:UIImageView!
    @IBOutlet weak var nameMovie:UILabel!
    static let identifer = "movieCell"
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    func configure(with movie:Movie) {
        avatar?.contentMode = .scaleAspectFill
        avatar?.clipsToBounds = true
        avatar?.image = UIImage(named: "\(movie.imageName)")
        nameMovie?.text = movie.title
    }
    static func nib() -> UINib {
        return UINib(nibName: "CustomCellMovie", bundle: nil)
    }
}
