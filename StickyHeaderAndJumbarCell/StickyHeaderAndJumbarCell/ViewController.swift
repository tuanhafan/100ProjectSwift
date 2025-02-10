//
//  ViewController.swift
//  StickyHeaderAndJumbarCell
//
//  Created by AlexTran on 10/02/2025.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView:UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        groupedUserByAlphaBet()
    }
    
    var groupedUser = [String:[User]]()
    var sectionTitiles = [String]()
    
    func groupedUserByAlphaBet() {
        let grouped = Dictionary(grouping: users){
            String($0.name.prefix(1))
        }
        
        groupedUser = grouped.mapValues{$0.sorted{$0.name < $1.name}}
        sectionTitiles = groupedUser.keys.sorted()
        print(groupedUser)
        print("section:\(sectionTitiles)" )
        
    }
    

}
extension ViewController: UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitiles.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitiles[section]
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = sectionTitiles[section]
        return groupedUser[key]?.count ?? 0
    }
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return sectionTitiles.firstIndex(of: title) ?? 0
    }
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sectionTitiles
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let key = sectionTitiles[indexPath.section]
        if let usersInsection = groupedUser[key] {
            cell.textLabel?.text = usersInsection[indexPath.row].name
        }
        return cell
    }
}
