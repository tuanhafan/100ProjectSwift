//
//  NewHotMovieModel.swift
//  TixAura
//
//  Created by Alex Tran on 8/5/25.
//

import UIKit

class TrendingViewController: UIViewController,CoordinatorInEjectable  {

    @IBOutlet weak var tableView: UITableView!
    var mainCoordinator : MainCoordinator?
    let header = CustomHeaderView()
    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.addSubview(header)
//        view.bringSubviewToFront(header)
//        header.layer.zPosition = CGFloat(Float.greatestFiniteMagnitude)
//        header.layoutActive(wtth: view)
//        let headertb = HeroHeaderTableView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 450))
//        tableView.tableHeaderView = headertb
    }
    

    

}

extension TrendingViewController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 20
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.backgroundColor = .white // Màu đặc, không dùng .clear
        cell.contentView.isOpaque = true
        cell.layer.allowsGroupOpacity = false
        return cell
    }
}
