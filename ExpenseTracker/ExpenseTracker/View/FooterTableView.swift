//
//  FooterTable.swift
//  ExpenseTracker
//
//  Created by AlexTran on 14/02/2025.
//

import UIKit

class FooterTableView: UIView {

    let iconTransection: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(systemName: "rectangle.portrait.and.arrow.right.fill")
        icon.tintColor = .green
        icon.contentMode = .scaleAspectFit
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    let iconReport: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(systemName: "archivebox.circle.fill")
        icon.tintColor = .lightGray
        icon.contentMode = .scaleAspectFit
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()

    let lblReport : UILabel = {
        let label = UILabel()
        label.text = "Report"
        label.textColor = .gray
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let lblTransections : UILabel = {
        let label = UILabel()
        label.text = "Transections"
        label.textColor = .green
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let stackViewTransections : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    let stackViewReport : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    func setUpFooterView() {
        
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.lightGray.cgColor
        
        stackViewTransections.addArrangedSubview(iconTransection)
        stackViewTransections.addArrangedSubview(lblTransections)
        
        stackViewReport.addArrangedSubview(iconReport)
        stackViewReport.addArrangedSubview(lblReport)
        
        self.addSubview(stackViewTransections)
        self.addSubview(stackViewReport)
        
        NSLayoutConstraint.activate([
        
            stackViewReport.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -15),
            stackViewReport.heightAnchor.constraint(equalTo: self.heightAnchor),
            
            stackViewTransections.trailingAnchor.constraint(equalTo: stackViewReport.leadingAnchor,constant: -60),
            stackViewTransections.heightAnchor.constraint(equalTo: self.heightAnchor),
            
        ])
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpFooterView()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpFooterView()
    }
}
