//
//  ViewController.swift
//  PullToRefreshTable
//
//  Created by AlexTran on 06/02/2025.
//

import UIKit

protocol AddItemToTbDelegate : AnyObject {
    func addItemToTb(_ item: String)
}

var data:[String] = ["label1","label2","label3","label4","label5","label6","label7","label8",]

class ViewController: UIViewController, AddItemToTbDelegate {

    @IBOutlet weak var btnAdd: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editAction))
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addItemToTb" {
            if let addItemVC = segue.destination as? AddIItemViewController {
                addItemVC.delegateAddItem = self 
            }
        }
    }
    
    func setUpRefreshControll() {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshAction), for: .valueChanged)
        tableView.refreshControl = refreshControl
        
    }
    
    func addItemToTb(_ item:String) {
        data.append(item)
        tableView.reloadData()
        print(data)
    }
    
    @objc func refreshAction(){
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.tableView.reloadData()
            self.tableView.refreshControl?.endRefreshing()
        }
    }
    
    @objc func editAction(){
                tableView.isEditing = !tableView.isEditing
                tableView.reloadData()
    }
    
}

class CustomCell : UITableViewCell {
    
    @IBOutlet weak var lblText: UILabel!
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = data[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        cell.lblText.text = item
        return cell
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            data.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        } else {return}
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let moveObject = data[sourceIndexPath.row]
        data.remove(at: sourceIndexPath.row)
        data.insert(moveObject, at: destinationIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
}
