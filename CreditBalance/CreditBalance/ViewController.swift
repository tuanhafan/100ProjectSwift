//
//  ViewController.swift
//  CreditBalance
//
//  Created by AlexTran on 12/02/2025.
//

import UIKit

struct Recent {
    let avatar: String
    let name :String
    let time:String
    let balance:Double
}

let recents:[Recent] = [
    Recent(avatar: "cup.and.saucer.fill", name: "StarBucks", time: "7:30am", balance: 14.25),
    Recent(avatar: "lock.fill", name: "Henry and Smith", time: "Jul 08, 10:44pm", balance: 155.10),
    Recent(avatar: "hammer.fill", name: "Apple Service", time: "Jul 08, 9:44pm", balance: 220.23),
]

class ViewController: UIViewController {

    @IBOutlet weak var tableViewHeader: UITableView!
    
    @IBOutlet weak var lblrecent: UILabel!
    
    @IBOutlet weak var tableViewContent: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableViewContent.register(CustomCell.self, forCellReuseIdentifier: "cell")
        tableViewHeader.register(CustomCell.self, forCellReuseIdentifier: "cellHeader")
        tableViewContent.rowHeight = 60
        tableViewContent.separatorStyle = .none
        tableViewHeader.rowHeight = UITableView.automaticDimension
        
        
    }
    
    
}

extension ViewController : UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(tableView == tableViewContent) {
            return recents.count
        } else {
            return 1
        }
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(tableView == tableViewContent)
        {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomCell else {
              
                return UITableViewCell()
        }
            let recent:Recent = recents[indexPath.row]
            cell.configure(recent: recent,typeCell: "Content")
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellHeader", for: indexPath) as? CustomCell else {
              
                return UITableViewCell()
        }
            
            cell.configure(typeCell: "Header")
            return cell
        }
        
    }
}
