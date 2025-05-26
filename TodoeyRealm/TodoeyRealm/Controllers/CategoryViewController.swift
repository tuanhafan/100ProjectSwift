//
//  CategoryViewController.swift
//  TodoeyRealm
//
//  Created by Alex Tran on 16/4/25.
//

import UIKit
import RealmSwift

class CategoryViewController: UITableViewController {
    
    var categories = Array<Category>()
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCategory()
//        print(Realm.Configuration.defaultConfiguration.fileURL)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let gotItemVC = segue.destination as? ItemViewController {
            gotItemVC.parentId = sender as? String
        }
    }
    
    // MARK: - Create and Add category
    
    @IBAction func addPressed(_ sender: UIBarButtonItem) {
        let alert = alertAddManager(
            "Add new Category",
            "", "Add Category",
            "Add new Category",
            { textField in
                let newCategory = Category()
                newCategory.name = textField
                do {
                    try RealmManager.shared.create(newCategory)
                    self.categories.append(newCategory)
                    self.tableView.reloadData()
                }
                catch {
                    print(error)
                }
                
            }
        )
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Read Category
    
    private func fetchCategory() {
            do {
                let data  = try RealmManager.shared.readParents(Category.self)
                DispatchQueue.main.async {
                    self.categories =  data
                    self.tableView.reloadData()
                }
            } catch {
                print(error)
            }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let category : Category = categories[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath)
        cell.textLabel?.text = category.name
        return cell
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "gotoItem", sender: categories[indexPath.row].id)
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let category = categories[indexPath.row]
        
        let editAction = UIContextualAction(style: .normal, title: "Edit"){(action, view, completionHandler) in
            let alert = alertEditManager("Edit Category", "", category.name) { name in
                do {
                    try RealmManager.shared.update(category, name: name)
                    self.tableView.reloadData()
                } catch {
                    print(error)
                }
            }
            completionHandler(true)
            self.present(alert, animated: true, completion: nil)
            
        }
        editAction.backgroundColor = .blue
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete"){(action, view, completionHandler) in
            do {
                try RealmManager.shared.deleteParent(
                    ofParentType: Category.self,
                    childType: Item.self,
                    parentId: self.categories[indexPath.row].id,
                    relationshipProperty: "items")
            } catch {
                print ("khong xoa duoc")
            }
            self.categories.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
            let configuaration = UISwipeActionsConfiguration(actions: [editAction,deleteAction])
            return configuaration
    }
    
}
