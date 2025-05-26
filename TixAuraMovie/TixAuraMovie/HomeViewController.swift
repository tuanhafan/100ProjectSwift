//
//  HomeViewController.swift
//  TixAuraMovie
//
//  Created by Alex Tran on 12/5/25.
//

import UIKit

class HomeViewController: UIViewController {
    private let homeFeedTable: UITableView = {
           let table = UITableView(frame: .zero, style: .grouped)
           table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
           return table
       }()
    override func viewDidLoad() {
        super.viewDidLoad()
        print("here")
       view.backgroundColor = .systemBackground
       view.addSubview(homeFeedTable)
       homeFeedTable.dataSource = self
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let headerView = HeroHeaderTb(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 500))
        homeFeedTable.tableHeaderView = headerView
    }
    override func viewDidLayoutSubviews() {
           super.viewDidLayoutSubviews()
           homeFeedTable.frame = view.bounds
       }


}

extension HomeViewController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 20
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath)
       
        return cell
    }
}
