//
//  HomeMovieModel.swift
//  TixAura
//
//  Created by Alex Tran on 8/5/25.
//

import UIKit

class HomeViewController: UIViewController,CoordinatorInEjectable, UINavigationControllerDelegate {
    
   
   @IBOutlet weak var tableView: UITableView!
    
    let header = CustomHeaderView()
    var mainCoordinator : MainCoordinator?
  
    var selectedImageView: UIImageView?
    var selectedIndexPath: IndexPath?
    private var genres:[Genre] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.addSubview(header)
        view.bringSubviewToFront(header)
        header.layer.zPosition = CGFloat(Float.greatestFiniteMagnitude)
        header.layoutActive(wtth: view)
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.rowHeight = 140
        tableView.separatorStyle = .none
        tableView.register(CustomHomeTableViewCell.self, forCellReuseIdentifier: CustomHomeTableViewCell.identifier)
         let headerView = HeroHeaderTableView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 600))
        tableView.tableHeaderView = headerView
        fetchGenres()
    }
    
    
    func sendImageToTabBarController(imageView: UIImageView, movie: Movie) {
            if let tabBar = self.tabBarController as? CustomTabBarController {
                tabBar.imageView = imageView
                if let detailVC = storyboard?.instantiateViewController(withIdentifier: "DetailMovieViewController") as? DetailMovieViewController {
                    detailVC.movieID = movie.id
                    detailVC.imageView = imageView
                    detailVC.view.layoutIfNeeded()
                    tabBar.navigationController?.pushViewController(detailVC, animated: true)
                }
            }
        }
    private func fetchGenres() {
        let apiService = APIService()
        apiService.fetchGenres{ result in
            switch result {
            case .success(let geners) :
                self.genres = geners
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error) :
                print("Lỗi: \(error)")
            }
            
        }
    }
    
}



extension HomeViewController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return genres.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let  cell = tableView.dequeueReusableCell(withIdentifier:CustomHomeTableViewCell.identifier, for: indexPath) as? CustomHomeTableViewCell else {
            return UITableViewCell()
        }
        cell.onItemSelected = { [weak self] imageView, movie in
            guard let self = self else { return }
            
            self.selectedImageView = imageView
            self.selectedIndexPath = indexPath
            sendImageToTabBarController(imageView: imageView, movie: movie)
            
            
        }
        
        cell.configuration(with: genres[indexPath[0]].id)
        return cell
    }
}


extension HomeViewController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        let titleLabel = UILabel()
        titleLabel.text = "\(genres[section].name)"
        titleLabel.textColor = .white
        titleLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        headerView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 5),
            titleLabel.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -8)
        ])
        return headerView
    }
}

extension HomeViewController : UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let visible = (offsetY + 60) > 5 ? true : false
        header.setBlurVisible(visible)
    }
}



