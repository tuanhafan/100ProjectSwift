//
//  CustomCell.swift
//  CreditBalance
//
//  Created by AlexTran on 12/02/2025.
//

import UIKit

class CustomCell: UITableViewCell {

    let viewAva : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
        view.layer.cornerRadius = 4
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let avatar : UIImageView = {
        let image = UIImageView()
        image.tintColor = UIColor.lightGray
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    let stackView :UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    let lblName : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18,weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }() 
    let lblTime : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let lblBalance : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18,weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    

        viewAva.addSubview(avatar)
        stackView.addArrangedSubview(lblName)
        stackView.addArrangedSubview(lblTime)
        
        contentView.addSubview(viewAva)
        contentView.addSubview(stackView)
        contentView.addSubview(lblBalance)
        
        NSLayoutConstraint.activate([
            
            viewAva.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            viewAva.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            viewAva.widthAnchor.constraint(equalToConstant: 50),
            viewAva.heightAnchor.constraint(equalToConstant: 50),
            
            
            avatar.widthAnchor.constraint(equalToConstant: 30),
            avatar.heightAnchor.constraint(equalToConstant: 30),
            avatar.centerXAnchor.constraint(equalTo: viewAva.centerXAnchor),
            avatar.centerYAnchor.constraint(equalTo: viewAva.centerYAnchor),
            
            
            stackView.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 20),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 5),
            
            
            lblBalance.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            lblBalance.topAnchor.constraint(equalTo: contentView.topAnchor),
            lblBalance.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
        
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    func configure(recent item:Recent){
        avatar.image = UIImage(systemName: "\(item.avatar)")
        lblName.text = "\(item.name)"
        lblTime.text = "\(item.time)"
        lblBalance.text = "€\(item.balance)"
    }
}
