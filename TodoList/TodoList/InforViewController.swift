//
//  InforViewController.swift
//  TodoList
//
//  Created by AlexTran on 07/02/2025.
//

import UIKit

class InforViewController: UIViewController {

    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var lblName:UILabel!
    @IBOutlet weak var lblAge:UILabel!
    @IBOutlet weak var lblCarrer:UILabel!
    @IBOutlet weak var textDes: UITextView!
    
    
    var person:Person?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let person = person else {
            avatar.image = UIImage(systemName: "person")
            lblName.text = "No data"
            lblAge.text = "No data"
            lblCarrer.text = "no data"
            textDes.text = "No date"
            return
        }
        
        avatar.image = UIImage(named: "\(person.avatar)")
        lblName.text = person.name
        lblAge.text = "\(person.age)"
        lblCarrer.text = person.career
        textDes.text = person.description
       
    }
    

    
}
