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
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "ellipsis"), style: .plain, target: self, action: #selector(alertAction))
        
        
        
    }

    @objc func alertAction(){
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Report", style: .destructive, handler: nil))
        actionSheet.addAction(UIAlertAction(title: "Share", style: .default, handler: nil))
        actionSheet.addAction(UIAlertAction(title: "Save Image", style: .default, handler: nil))
        actionSheet.addAction(UIAlertAction(title: "Coppy Link", style: .default,handler: nil))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(actionSheet,animated: true,completion: nil)
    }
}
