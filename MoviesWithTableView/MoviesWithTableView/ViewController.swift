//
//  ViewController.swift
//  MoviesWithTableView
//
//  Created by AlexTran on 21/02/2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableContent: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var data : [Movie] = movies
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }

   
    
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row].title
        return cell
    }
}
extension ViewController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        var newData  = movies.filter {$0.title.lowercased().contains(searchText.lowercased())}
        data = newData
        tableContent.reloadData()
    }
}
