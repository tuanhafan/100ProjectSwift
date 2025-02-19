//
//  ViewController.swift
//  BudgetBloom
//
//  Created by AlexTran on 17/02/2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var logoImage: UIImageView!
    
    @IBOutlet weak var lblNameBudget: UILabel!
    
    @IBOutlet weak var searBar: UISearchBar!
    
    @IBOutlet weak var tableContent: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(openAddNewExpenseView))
        
        tableContent.rowHeight = 50
        tableContent.register(CustomHeaderView.self, forHeaderFooterViewReuseIdentifier: CustomHeaderView.identifer)
        tableContent.register(CustomFooterView.self, forHeaderFooterViewReuseIdentifier: CustomFooterView.identifer)
        tableContent.tableFooterView = UIView()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addNewExpense" {
            if let newExpense = segue.destination as? AddNewExPense {
                newExpense.addNew = { [weak self] (key, expense) in
                    print(key)
                    if transactionData[key] != nil {
                        transactionData[key]?.insert(expense, at: 0)
                        self?.tableContent.reloadData()
                    } else {
                        transactionData[key] = [expense]
                        self?.tableContent.reloadData()
                    }
                }
            }
        }
    }
    
    @objc func openAddNewExpenseView() {
        performSegue(withIdentifier: "addNewExpense", sender: nil)
    }

}

extension ViewController : UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitle.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = sectionTitle[section]
        return transactionData[key]?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: CustomHeaderView.identifer) as? CustomHeaderView
        headerView?.configure(with: sectionTitle[section])
        return headerView
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let footerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: CustomFooterView.identifer) as? CustomFooterView
        let key = sectionTitle[section]
        footerView?.configure(with: formatNumberAmount(transactionData[key]!.reduce(0){$0 + $1.amount}) )
        return footerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomCell else {
            return UITableViewCell()
        }
        let key = sectionTitle[indexPath.section]
        if let transactions = transactionData[key] {
            let transaction = transactions[indexPath.row]
            cell.lblDate.text = transaction.date
            cell.lblNameExpense.text = transaction.nameExpense
            cell.lblAmount.text = formatNumberAmount(transaction.amount)
        }
        return cell
    }
}
