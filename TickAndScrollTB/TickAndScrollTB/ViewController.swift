//
//  ViewController.swift
//  TickAndScrollTB
//
//  Created by AlexTran on 09/02/2025.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var tableView:UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}
func checkBtn(_ sender: UIButton){
    var check =  users[sender.tag].check
   
    if(check){
         sender.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
        sender.tintColor = UIColor.green
    } else {
        sender.setImage(UIImage(systemName: "circle"), for: .normal)
        sender.tintColor = UIColor.darkGray
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let user:User = users[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        cell.lblName.text = user.name
        cell.btnCheck.tag = indexPath.row
        checkBtn(cell.btnCheck)
        return cell
    }
    
}

class CustomCell : UITableViewCell {
    @IBOutlet weak var lblName:UILabel!
    @IBOutlet weak var btnCheck:UIButton!
    @IBAction func btnCheckAction(_ sender:UIButton) {
        var check =  users[sender.tag].check
        check.toggle()
        if(check){
             sender.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
            sender.tintColor = UIColor.green
        } else {
            sender.setImage(UIImage(systemName: "circle"), for: .normal)
            sender.tintColor = UIColor.darkGray
        }
        users[sender.tag].check = check
    }
}
