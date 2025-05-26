//
//  ItemViewController.swift
//  TodoeyRealm
//
//  Created by Alex Tran on 16/4/25.
//

import UIKit

class ItemViewController: UITableViewController {
    
    var arrayItems = Array<Item>()
    var parentId:String?
    var predicate : String = "" {
        didSet {
            fetchItems()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchItems()
        
    }
    
    // MARK: - Create and Add Item
    @IBAction func addPressed(_ sender: UIBarButtonItem) {
        
        let alert = alertAddManager(
            "Add new Item",
            "", "Add Item",
            "Add new item",
            { textField in
                let item = Item()
                item.name = textField
                do {
                    try RealmManager.shared.createChild(
                        ofParentType: Category.self,
                        child: item,
                        parentId: self.parentId!,
                        relationshipProperty: "items")
                    self.fetchItems()
                } catch {
                    print("lỗi không tạo được Item")
                }
            }
        )
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: - read Item
    
    private func fetchItems(){
        if let parentIdCheck = parentId {
                do {
                    let data = try RealmManager.shared.readChidren(
                        ofParentType: Category.self,
                        childType: Item.self,
                        parentId: parentIdCheck,
                        relationshipProperty: "items",
                        filter: predicate
                    )
                    DispatchQueue.main.async {
                        self.arrayItems = data
                        self.tableView.reloadData()
                    }
                }catch {
                    print(error)
                }
        }
       
    }
    
    
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = arrayItems[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath)
        cell.textLabel?.text = item.name
        return cell
    }
    
    // MARK: - Table view Delegate
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let item = arrayItems[indexPath.row]
        
        let editAction = UIContextualAction(style: .normal, title: "Edit"){(action, view, completionHandler) in
            let alert = alertEditManager("Edit Category", "", item.name) { name in
                do {
                    try RealmManager.shared.update(item, name: name)
                    self.tableView.reloadData()
                } catch {
                    print(error)
                }
            }
            completionHandler(true)
            self.present(alert, animated: true, completion: nil)
        }
        editAction.backgroundColor = .blue
        
        let deleteAcion = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completionHanlder) in
        
            do {
                try RealmManager.shared.delete(self.arrayItems[indexPath.row])
            } catch {
                print("No delete")
            }
            self.arrayItems.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
        }
        
        let configuration = UISwipeActionsConfiguration(actions: [editAction,deleteAcion])
        return configuration
    }
    
    
}

extension ItemViewController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if(searchText.isEmpty) {
            predicate = ""
        }else {
            predicate = "name CONTAINS[cd] '\(searchText)'"
        }
    }
}
