//
//  DetailImage.swift
//  CollectionViewBasic
//
//  Created by AlexTran on 21/02/2025.
//

import UIKit

class DetailImage: UIViewController {

    var nameImage:String = "20"
    @IBOutlet weak var imageContent: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageContent.image = UIImage(named: nameImage)
        imageContent.contentMode = .scaleAspectFill
    }


}
