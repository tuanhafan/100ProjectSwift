//
//  ViewController.swift
//  ExpenseTracker
//
//  Created by AlexTran on 14/02/2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableViewContent :UITableView!
    @IBOutlet weak var footer : UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewContent.rowHeight = UITableView.automaticDimension
        tableViewContent.estimatedRowHeight = 80
        tableViewContent.register(CustomCell.self, forCellReuseIdentifier: "cell")
        tableViewContent.layer.borderWidth = 1
        tableViewContent.layer.borderColor = UIColor.lightGray.cgColor
        
        let headerTableView = HeaderTableView(frame: CGRect(x: 0, y: 0, width: tableViewContent.frame.width, height: 250))
        let footerTableView = FooterTableView(frame: CGRect(x: 0, y: 0, width: tableViewContent.frame.width, height: 60))
        
        tableViewContent.tableHeaderView = headerTableView
        footer.addSubview(footerTableView)
        
    }

}

extension ViewController:UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return expenses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let expense:Expense = expenses[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomCell else {
            return UITableViewCell()
        }
        cell.configure(expense: expense)
        return cell
    }
}

