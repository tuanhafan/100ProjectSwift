//
//  ViewController.swift
//  Movies
//
//  Created by AlexTran on 22/02/2025.
//

import UIKit

class ViewController: UIViewController {
    
    

    @IBOutlet weak var viewContent: MainView!
    @IBOutlet weak var segmented: UISegmentedControl!
  
    var tableMovies = MoviesTable()
   
    @IBOutlet weak var viewSearch: ViewSearch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Genres", style: .plain, target: self, action: #selector(genresAction))
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "magnifyingglass"),
            style: .plain,
            target: self,
            action: #selector(searchAction)
        )
        
      
        view.addSubview(tableMovies)
        view.bringSubviewToFront(viewSearch)

        NSLayoutConstraint.activate([
            tableMovies.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            tableMovies.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableMovies.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableMovies.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
           
            
        ])
    
        tableMovies.isHidden = true
        viewSearch.cancelButton = { [weak self] in
            self?.navigationController?.navigationBar.isHidden = false
        }
    }
    
    
    
    
    @IBAction func segmentedAction(_ sender: UISegmentedControl) {
            
            UIView.transition(with: view, duration: 0.2, options: .transitionCrossDissolve, animations: {}, completion: nil)
        if sender.selectedSegmentIndex == 0 {
            viewContent.isHidden = false
            tableMovies.isHidden = true
        } else {
            viewContent.isHidden = true
            tableMovies.isHidden = false
        }
    }
   
    
    @objc func genresAction() {
        
    }
    
    @objc func searchAction() {
        UIView.animate(withDuration: 0.3) {
            self.viewSearch.isHidden = false
            self.navigationController?.navigationBar.isHidden = true
                }
       
    }
}



