//
//  ViewController.swift
//  BasicTableView
//
//  Created by AlexTran on 04/02/2025.
//

struct item {
   let id:Int
   let name:String?
}
import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    var data:[item] = [item(id: 1, name: "Iphone"),item(id: 2, name: "Iphone2"),item(id: 3, name: "Iphone3"),item(id: 4, name: "Iphone4"),item(id: 5, name: "Iphone5"),item(id: 6, name: "Iphone6"),]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Reset", style: .plain, target: self, action: #selector(resetTable))
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "mycell")
        if cell == nil {
             cell = UITableViewCell(style: .default, reuseIdentifier: "mayCell")
           
        }
        let item = data[indexPath.row]
        
        cell?.textLabel?.text = item.name
        cell?.accessoryType = .disclosureIndicator
        return cell!
    }
    @objc func resetTable(){
        
    }

}

