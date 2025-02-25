//
//  CustomCellTableMovie.swift
//  Movies
//
//  Created by AlexTran on 24/02/2025.
//

import UIKit

class CustomCellTableMovie: UITableViewCell {

    static let identifer = "cellTableMovie"
    @IBOutlet weak var lblIndex : UILabel!
    @IBOutlet weak var avatar : UIImageView!
    @IBOutlet weak var stackView : UIStackView!
    @IBOutlet weak var lblNameMovie: UILabel!
    @IBOutlet weak var lblActor: UILabel!
    @IBOutlet weak var lblArea : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUp()
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
       
    }
    func setUp() {
        avatar.contentMode = .scaleAspectFit
        avatar.clipsToBounds = true
    }

    func configure(with movie : Movie, indexPath: Int ) {
        lblIndex.text = "\(indexPath + 1)"
        avatar.image = UIImage(named: movie.imageName)
        lblNameMovie.text = movie.title
        lblActor.text = movie.actors.joined(separator:",")
        lblArea.text = movie.showtimeLocation
    }
  
    
    static func nib() -> UINib {
        return UINib(nibName: "CustomCellTableMovie", bundle: nil)
    }
}
