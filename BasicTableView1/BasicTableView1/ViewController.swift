//
//  ViewController.swift
//  BasicTableView1
//
//  Created by AlexTran on 05/02/2025.
//

import UIKit

let items = ["mot","hai","ba","bon","nam","6","7","8","9"]

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt IndexPath : IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: IndexPath) as! CustomCell
        let item = items[IndexPath.row]
        cell.avatar.image = UIImage(systemName: "square.and.arrow.up.circle.fill")
        cell.lblName.text = item
        cell.icon.image = UIImage(systemName: "pencil.line")
        cell.lbldes.text = "zalo"
        return cell
    }

}




class CustomCell : UITableViewCell {
    
    @IBOutlet weak var avatar: UIImageView!
    
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var icon: UIImageView!
    
    @IBOutlet weak var lbldes: UILabel!
    
    
}
