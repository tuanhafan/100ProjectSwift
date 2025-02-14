//
//  CustomCell.swift
//  ExpenseTracker
//
//  Created by AlexTran on 14/02/2025.
//

import UIKit

class CustomCell: UITableViewCell {
    let viewTop : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let viewBottom : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let separatorTop : UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let stackViewInTop : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    let stackViewInBottom : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let stackViewDescription : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let lblDay : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 28,weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let lblDayOfWeek : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let lblDate : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let lblDeductibleAmount : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15,weight: .medium)
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let lblCategory : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18,weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }() 
    let lblDescription : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .lightGray
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let lblAmount : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15,weight: .medium)
        label.textColor = .red
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let viewImage : UIView = {
        let view = UIView()
        view.backgroundColor = .systemIndigo
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let avatar : UIImageView  = {
        let image = UIImageView(image: UIImage(named: "cocktail"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    let icon : UIImageView  = {
        let image = UIImageView(image: UIImage(named: "bitcoin3"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        stackViewDescription.addArrangedSubview(icon)
        stackViewDescription.addArrangedSubview(lblDescription)
        
        stackViewInTop.addArrangedSubview(lblDayOfWeek)
        stackViewInTop.addArrangedSubview(lblDate)
        stackViewInBottom.addArrangedSubview(lblCategory)
        stackViewInBottom.addArrangedSubview(stackViewDescription)
        viewImage.addSubview(avatar)
        
        viewTop.addSubview(lblDay)
        viewTop.addSubview(stackViewInTop)
        viewTop.addSubview(lblDeductibleAmount)
        viewBottom.addSubview(viewImage)
        viewBottom.addSubview(stackViewInBottom)
        viewBottom.addSubview(lblAmount)
        
        contentView.addSubview(separatorTop)
        contentView.addSubview(viewTop)
        contentView.addSubview(viewBottom)
        
        NSLayoutConstraint.activate([
            
            separatorTop.topAnchor.constraint(equalTo: contentView.topAnchor),
            separatorTop.heightAnchor.constraint(equalToConstant: 20),
            separatorTop.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            
            viewTop.topAnchor.constraint(equalTo: separatorTop.bottomAnchor,constant: 10),
            viewTop.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            viewTop.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            viewBottom.topAnchor.constraint(equalTo: viewTop.bottomAnchor,constant: 15),
            viewBottom.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            viewBottom.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            viewBottom.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -10),
            
           
            
            lblDay.leadingAnchor.constraint(equalTo: viewTop.leadingAnchor),
            lblDay.topAnchor.constraint(equalTo: viewTop.topAnchor),
            lblDay.bottomAnchor.constraint(equalTo: viewTop.bottomAnchor),
            lblDay.widthAnchor.constraint(equalToConstant: 40),
            
            stackViewInTop.leadingAnchor.constraint(equalTo: lblDay.trailingAnchor, constant: 15),
            stackViewInTop.topAnchor.constraint(equalTo: viewTop.topAnchor),
            stackViewInTop.bottomAnchor.constraint(equalTo: viewTop.bottomAnchor),
            
//            lblDeductibleAmount.leadingAnchor.constraint(equalTo: stackViewInTop.trailingAnchor),
            lblDeductibleAmount.topAnchor.constraint(equalTo: viewTop.topAnchor),
            lblDeductibleAmount.bottomAnchor.constraint(equalTo: viewTop.bottomAnchor),
            lblDeductibleAmount.trailingAnchor.constraint(equalTo: viewTop.trailingAnchor,constant: -15),
            
            
            viewImage.leadingAnchor.constraint(equalTo: viewBottom.leadingAnchor),
            viewImage.centerYAnchor.constraint(equalTo: viewBottom.centerYAnchor),
            viewImage.widthAnchor.constraint(equalToConstant: 40),
            viewImage.heightAnchor.constraint(equalToConstant: 40),
            
            avatar.widthAnchor.constraint(equalToConstant: 20),
            avatar.heightAnchor.constraint(equalToConstant: 20),
            avatar.centerYAnchor.constraint(equalTo: viewImage.centerYAnchor),
            avatar.centerXAnchor.constraint(equalTo: viewImage.centerXAnchor),
            
            icon.widthAnchor.constraint(equalToConstant: 12),
            icon.heightAnchor.constraint(equalToConstant: 12),
            
         
            
            stackViewInBottom.leadingAnchor.constraint(equalTo: lblDay.trailingAnchor, constant: 15),
            stackViewInBottom.topAnchor.constraint(equalTo: viewBottom.topAnchor),
            stackViewInBottom.bottomAnchor.constraint(equalTo: viewBottom.bottomAnchor),
            
            lblAmount.topAnchor.constraint(equalTo: viewBottom.topAnchor),
            lblAmount.bottomAnchor.constraint(equalTo: viewBottom.bottomAnchor),
            lblAmount.trailingAnchor.constraint(equalTo: viewBottom.trailingAnchor,constant: -15),
        ])
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configure(expense:Expense) {
        lblDay.text = "\(expense.day)"
        lblDayOfWeek.text = expense.dayOfWeeek
        lblDate.text = expense.date
        lblDeductibleAmount.text = "-$ \(formatNumberGrand(expense.amount))"
        lblCategory.text = expense.category
        lblDescription.text = expense.description
        lblAmount.text = "$ \(formatNumberGrand(expense.amount))"
    }
}
