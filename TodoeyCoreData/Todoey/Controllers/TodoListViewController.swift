//
//  ViewController.swift
//  Todoey
//
//  Created by AlexTran on 25/03/2025.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var category:Category? {
        didSet {
            loadData()
        }
    }
    var itemArray : [Item] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    //MARK: - table view data source methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item : Item = itemArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = item.title
        cell.accessoryType = item.done ? .checkmark : .none
        return  cell
    }
    //MARK: - table view delegate methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark) {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        CoreDataManagerItem.shared.saveContext()
       
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "delete") {(action, view, completionHandler) in
            self.itemArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            completionHandler(true)
        }
        
        let confguration =  UISwipeActionsConfiguration(actions: [deleteAction])
        
        do  { try CoreDataManagerItem.shared.deleteItem(itemArray[indexPath.row])} catch {print("not delete")}
        
        return confguration
    }
    
    //MARK: - add new item
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        let alert = CustomAlertAddnew(
            "Add new Todoey Item",
            "",
            "Add Item",
            "Add new Item",
            {
                text in try CoreDataManagerItem.shared.createItem(category:self.category!,title: text)
            },
            {
                newItem in self.itemArray.append(newItem as! Item)
            },
            {
                self.tableView.reloadData()
            }
        )
        present(alert, animated: true, completion: nil)
    }
    
    //MARK: -  Load Data
    func loadData() {
        do {
            itemArray = try CoreDataManagerItem.shared.fetchItems(category: category!)
            tableView.reloadData()
        } catch {
            itemArray = []
            print("Không lấy được dữ liệu ")
        }
    }
    
    //MARK: - laod data from category
    
   
}
    
//MARK: - Search Bar Delegate
extension TodoListViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        searchBar.text = ""
        searchBar.resignFirstResponder()
        loadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if(searchText.isEmpty) {
            loadData()
        } else {
            do {
                itemArray = try CoreDataManagerItem.shared.searchItem(textSearch: searchText, category: category!)
                self.tableView.reloadData()
            } catch {
                print("Không lấy được dữ liệu ")
            }
        }
       
    }
   
}
