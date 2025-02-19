//
//  CustomFooterView.swift
//  BudgetBloom
//
//  Created by AlexTran on 18/02/2025.
//

import UIKit

class CustomFooterView: UITableViewHeaderFooterView {

   
    static let identifer = "CustomFooterView"
    
    let lblTitle : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16,weight: .bold)
        label.textColor = UIColor.systemGray2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(lblTitle)
        
        
        NSLayoutConstraint.activate([
            
            lblTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            lblTitle.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
         
        ])
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configure(with title:String) {
        lblTitle.text = "Total: \(title)"
    }
}
