//
//  HeaderTableView.swift
//  ExpenseTracker
//
//  Created by AlexTran on 14/02/2025.
//

import UIKit

class HeaderTableView: UIView {

    
    let lblTimeDate : UILabel = {
        let label = UILabel()
        label.text = "4:44 PM Fri May 25"
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let lblDaily : UILabel = {
        let label = UILabel()
        label.text = "Daily Expense"
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let lblLastMonth : UILabel = {
        let label = UILabel()
        label.text = "LAST MONTH"
        label.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let lblThisMonth : UILabel = {
        let label = UILabel()
        label.text = "THIS MONTH"
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let lblFuture : UILabel = {
        let label = UILabel()
        label.text = "FUTURE"
        label.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let lblAmount : UILabel = {
        let label = UILabel()
        label.text = "$ 9,9170.01"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let lblTitleOpeningBalance : UILabel = {
        let label = UILabel()
        label.text = "OpeningBalance"
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let lblOpeningBalance : UILabel = {
        let label = UILabel()
        label.text = "+$ 7,550.00"
        label.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let lblTitleEndingBalance : UILabel = {
        let label = UILabel()
        label.text = "EndingBalance"
        label.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let lblEndingBalance : UILabel = {
        let label = UILabel()
        label.text = "+$ 9,917.01"
        label.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let lblNetChange : UILabel = {
        let label = UILabel()
        label.text = "+$ 2,367.01"
        label.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let lblViewReport : UILabel = {
        let label = UILabel()
        label.text = "View report for this perried"
        label.textColor = .green
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let avatar : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "cocktail")
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 20
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let iconAvatar : UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(systemName: "arrowtriangle.down.fill",withConfiguration: UIImage.SymbolConfiguration(pointSize: 8))
        icon.tintColor = .gray
        icon.contentMode = .scaleAspectFit
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    let iconNotifi : UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(systemName: "bell.fill")
        icon.tintColor = .green
        icon.contentMode = .scaleAspectFit
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    let iconInformation : UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(systemName: "ellipsis")
        icon.tintColor = .green
        icon.contentMode = .scaleAspectFit
        icon.transform = CGAffineTransform(rotationAngle: .pi / 2)
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    let stackViewDaily : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalCentering
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let stackViewMonth : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalCentering
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let stackViewAvatar : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let stackViewTitleExpense : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let stackViewIconRight : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    let stackViewIOpeningBalance: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    let stackViewIEndingBalance: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    let viewBalance : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let viewBorder : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let viewBorderBlance : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray.withAlphaComponent(0.4)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func setUpHeaderView() {
        
        stackViewAvatar.addArrangedSubview(avatar)
        stackViewAvatar.addArrangedSubview(iconAvatar)
        
        stackViewTitleExpense.addArrangedSubview(lblDaily)
        stackViewTitleExpense.addArrangedSubview(lblAmount)
        
        stackViewIconRight.addArrangedSubview(iconNotifi)
        stackViewIconRight.addArrangedSubview(iconInformation)
        
        stackViewDaily.addArrangedSubview(stackViewAvatar)
        stackViewDaily.addArrangedSubview(stackViewTitleExpense)
        stackViewDaily.addArrangedSubview(stackViewIconRight)
        
        stackViewMonth.addArrangedSubview(lblLastMonth)
        stackViewMonth.addArrangedSubview(lblThisMonth)
        stackViewMonth.addArrangedSubview(lblFuture)
        
        stackViewIOpeningBalance.addArrangedSubview(lblTitleOpeningBalance)
        stackViewIOpeningBalance.addArrangedSubview(lblOpeningBalance)
        
        stackViewIEndingBalance.addArrangedSubview(lblTitleEndingBalance)
        stackViewIEndingBalance.addArrangedSubview(lblEndingBalance)
        
        viewBalance.addSubview(stackViewIOpeningBalance)
        viewBalance.addSubview(stackViewIEndingBalance)
        viewBalance.addSubview(lblNetChange)
        viewBalance.addSubview(lblViewReport)
        viewBalance.addSubview(viewBorderBlance)
    
        self.addSubview(lblTimeDate)
        self.addSubview(stackViewDaily)
        self.addSubview(stackViewMonth)
        self.addSubview(viewBorder)
        self.addSubview(viewBalance)
        
        
        
        NSLayoutConstraint.activate([
        
            lblTimeDate.topAnchor.constraint(equalTo: self.topAnchor,constant: 10),
            lblTimeDate.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            
            stackViewDaily.topAnchor.constraint(equalTo: lblTimeDate.bottomAnchor,constant: 15),
            stackViewDaily.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 15),
            stackViewDaily.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            
            stackViewMonth.topAnchor.constraint(equalTo: stackViewDaily.bottomAnchor,constant: 15),
            stackViewMonth.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20),
            stackViewMonth.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            viewBorder.topAnchor.constraint(equalTo: stackViewMonth.bottomAnchor,constant: 10),
            viewBorder.heightAnchor.constraint(equalToConstant: 1),
            viewBorder.widthAnchor.constraint(equalTo: self.widthAnchor),
            
            viewBalance.topAnchor.constraint(equalTo: viewBorder.bottomAnchor,constant: 15),
            viewBalance.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 15),
            viewBalance.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            viewBalance.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            
            avatar.widthAnchor.constraint(equalToConstant: 40),
            avatar.heightAnchor.constraint(equalToConstant: 40),
        
            stackViewIOpeningBalance.topAnchor.constraint(equalTo: viewBalance.topAnchor),
            stackViewIOpeningBalance.widthAnchor.constraint(equalTo: viewBalance.widthAnchor),
            
            stackViewIEndingBalance.topAnchor.constraint(equalTo: stackViewIOpeningBalance.bottomAnchor,constant: 5),
            stackViewIEndingBalance.widthAnchor.constraint(equalTo: viewBalance.widthAnchor),
         
           
            lblNetChange.topAnchor.constraint(equalTo: viewBorderBlance.bottomAnchor,constant: 0),
            lblNetChange.trailingAnchor.constraint(equalTo: viewBalance.trailingAnchor),
            lblNetChange.heightAnchor.constraint(equalToConstant: 30),
            
            lblViewReport.topAnchor.constraint(equalTo: lblNetChange.bottomAnchor,constant: 5),
            lblViewReport.bottomAnchor.constraint(equalTo: viewBalance.bottomAnchor,constant: 10),
            lblViewReport.widthAnchor.constraint(equalTo: viewBalance.widthAnchor),
            
            viewBorderBlance.topAnchor.constraint(equalTo: stackViewIEndingBalance.bottomAnchor,constant: 5),
            viewBorderBlance.trailingAnchor.constraint(equalTo: viewBalance.trailingAnchor),
            viewBorderBlance.heightAnchor.constraint(equalToConstant: 1),
            viewBorderBlance.widthAnchor.constraint(equalToConstant: 100),
        ])
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpHeaderView()
    }
     required init?(coder: NSCoder) {
        super.init(coder: coder)
         setUpHeaderView()
    }
}
