//
//  MoviesTable.swift
//  Movies
//
//  Created by AlexTran on 24/02/2025.
//

import UIKit

class MoviesTable: UITableView {

    var movies : [Movie] = dataMovies
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }
    func setUp() {
    
       
        self.delegate = self
        self.dataSource = self
        self.translatesAutoresizingMaskIntoConstraints = false
        self.register(CustomCellTableMovie.nib(), forCellReuseIdentifier: CustomCellTableMovie.identifer)
        self.rowHeight = 80
        
        
    }
}

extension MoviesTable : UITableViewDelegate {
    
}

extension MoviesTable : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCellTableMovie.identifer, for: indexPath) as? CustomCellTableMovie else {
            return UITableViewCell()
        }
        cell.configure(with: movies[indexPath.row], indexPath: indexPath.row)
        return cell
    }
}
