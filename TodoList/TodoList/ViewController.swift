//
//  ViewController.swift
//  TodoList
//
//  Created by AlexTran on 07/02/2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editAction))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addUserAction))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "infor", let inforVc = segue.destination as? InforViewController {
            inforVc.person = sender as? Person
        }
    
        
        if segue.identifier == "addUser", let addUserVC = segue.destination as? AddUserViewController {
            addUserVC.delegate = self
        }
    }
    
    
    @objc func editAction () {
        
        tableView.isEditing = !tableView.isEditing
        tableView.reloadData()
    }
    
    @objc func addUserAction() {
        performSegue(withIdentifier: "addUser", sender: nil)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CutomCell
        let person:Person = people[indexPath.row]
        cell.avatar.image = UIImage(named: person.avatar)
        cell.lblName.text = person.name
        cell.lblCarrer.text = person.career
        return cell
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movePerson = people[sourceIndexPath.row]
        people.remove(at: sourceIndexPath.row)
        people.insert(movePerson, at: destinationIndexPath.row)
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            people.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let person :Person = people[indexPath.row]
        performSegue(withIdentifier: "infor", sender: person)
    }
    
}

extension ViewController: AddPersonDelegate {
    
    func addPerson(_ person: Person) {
        people.append(person)
        tableView.reloadData()
    }
    
}


class CutomCell : UITableViewCell {
    @IBOutlet weak var avatar : UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblCarrer: UILabel!
}
