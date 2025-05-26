//
//  ViewController.swift
//  CheckTable
//
//  Created by Alex Tran on 11/5/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var table: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let headerView = HeroHeaderTB(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 450))
        table.tableHeaderView = headerView
    }


}

extension ViewController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 20
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
       
        return cell
    }
}
