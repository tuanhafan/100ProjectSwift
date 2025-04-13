//
//  CategoryViewController.swift
//  Todoey
//
//  Created by AlexTran on 10/04/2025.
//

import UIKit

class CategoryViewController: UITableViewController {

    var categories : [Category] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Category"
       
        laodData()
    }

    //MARK: - Pass data segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let gotoItems = segue.destination as? TodoListViewController {
            gotoItems.category = sender as? Category
        }
    }
    
    
   //MARK: - Add new Category
    @IBAction func addBtnPressed(_ sender: UIBarButtonItem) {
        let alert = CustomAlertAddnew(
            "Add New Category",
            "",
            "Add category",
            "Add new category",
            { text in try CoreDataManagerCategory.shared.createCategory(name: text)},
            {newCategory in self.categories.append(newCategory as! Category)},
            {
                self.tableView.reloadData()
            })
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Table view data source

    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let category : Category = categories[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellCategory", for: indexPath)
        cell.textLabel?.text = category.name
        return cell
    }
   //MARK: -  Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItem", sender: categories[indexPath.row])
    }
    
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completionHandler) in
            self.categories.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            completionHandler(true)
            do {try CoreDataManagerCategory.shared.deleteCategory(category: self.categories[indexPath.row]) } catch {print("not delete")}
        }
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        return configuration
    }
    
    //MARK: - Load Data
    func laodData() {
        do {
            categories = try CoreDataManagerCategory.shared.fetchCategorys()
            print("lay du lieu \(categories)")
            self.tableView.reloadData()
        } catch {
            categories = []
            print("không lấy được dữ liệu")
        }
    }
    
    
}
