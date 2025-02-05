//
//  ViewController.swift
//  BasicTableView
//
//  Created by AlexTran on 04/02/2025.
//

struct item {
   let id:Int
   let name:String?
   var missed: Bool = false
}
import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    var data:[item] = [item(id: 1, name: "Iphone" )
                      ,item(id: 2, name: "0923233218", missed: true),
                       item(id: 3, name: "Iphone3"),
                       item(id: 4, name: "1234567898"),
                       item(id: 5, name: "2323213567", missed: true),
                       item(id: 6, name: "Iphone6"),]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(resetTable))
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "mycell")
      
        return cell!
    }
    @objc func resetTable(){
        
    }

}

