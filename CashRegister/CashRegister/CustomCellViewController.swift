//
//  CustomCellViewController.swift
//  CashRegister
//
//  Created by AlexTran on 12/02/2025.
//

import UIKit

class CustomCellViewController: UITableViewCell {

        var buttonCaculateMin : (()-> Void)?
        var buttonCaculateMax : (()-> Void)?
        let stackViewLeft : UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.alignment = .center
            stackView.translatesAutoresizingMaskIntoConstraints = false
            return stackView
        }()
        let stackViewRight : UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.alignment = .center
            stackView.spacing = 5
            stackView.translatesAutoresizingMaskIntoConstraints = false
            return stackView
        }()
        
        let lblCost : UILabel = {
            let label = UILabel()
            label.textColor = .white
            label.textAlignment = .center
            label.layer.masksToBounds = true
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        let iconMultiply : UIImageView = {
            let icon = UIImageView(image: UIImage(systemName: "multiply"))
            icon.tintColor = .gray
            return icon
        }()
        
        let lblCount : UILabel = {
            let label = UILabel()
            label.layer.cornerRadius = 5
            label.layer.masksToBounds = true
            label.backgroundColor = .lightGray
            label.textColor = .black
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        let lblTotalCost : UILabel = {
            let label = UILabel()
            label.text = "0.00"
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        let borderRight : UIView =  {
            let borderView = UIView()
            borderView.backgroundColor = .lightGray
            borderView.translatesAutoresizingMaskIntoConstraints = false
            return borderView
        }()
        let btnMinus :UIButton = {
            let btn = UIButton()
            btn.setImage(UIImage(systemName: "minus.circle.fill",withConfiguration: UIImage.SymbolConfiguration(pointSize: 35)), for: .normal)
            btn.tintColor = .gray
           
            btn.translatesAutoresizingMaskIntoConstraints = false
            return btn
        }()
        let btnPlus :UIButton = {
            let btn = UIButton()
            btn.setImage(UIImage(systemName: "plus.circle.fill",withConfiguration: UIImage.SymbolConfiguration(pointSize: 35)), for: .normal)
            btn.tintColor = .gray
            btn.translatesAutoresizingMaskIntoConstraints = false
            return btn
        }()
    
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            
            btnMinus.addTarget(self, action: #selector(btnMinAction), for: .touchUpInside)
            btnPlus.addTarget(self, action: #selector(btnMaxAction), for: .touchUpInside)
            
            stackViewLeft.addArrangedSubview(lblCost)
            stackViewLeft.addArrangedSubview(iconMultiply)
            stackViewLeft.addArrangedSubview(lblCount)
            stackViewRight.addArrangedSubview(lblTotalCost)
            stackViewRight.addArrangedSubview(borderRight)
            stackViewRight.addArrangedSubview(btnMinus)
            stackViewRight.addArrangedSubview(btnPlus)
            
            contentView.addSubview(stackViewLeft)
            contentView.addSubview(stackViewRight)
            
            NSLayoutConstraint.activate([
                lblCount.widthAnchor.constraint(equalToConstant: 45),
                lblCount.heightAnchor.constraint(equalToConstant: 45),
                iconMultiply.widthAnchor.constraint(equalToConstant: 20),
                
                borderRight.widthAnchor.constraint(equalToConstant: 1),
                borderRight.heightAnchor.constraint(equalToConstant: 40),
                
                lblCost.widthAnchor.constraint(equalToConstant: 45),
                lblCost.heightAnchor.constraint(equalToConstant: 45),
                
                btnMinus.widthAnchor.constraint(equalToConstant: 40),
                btnMinus.heightAnchor.constraint(equalToConstant: 40),
                
                btnPlus.widthAnchor.constraint(equalToConstant: 40),
                btnPlus.heightAnchor.constraint(equalToConstant: 40),
                
                stackViewLeft.topAnchor.constraint(equalTo: contentView.topAnchor),
                stackViewLeft.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                stackViewLeft.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 10),
                
                stackViewRight.topAnchor.constraint(equalTo: contentView.topAnchor),
                stackViewRight.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                stackViewRight.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -10)
            ])
        }
        required init?(coder: NSCoder) {
            super.init(coder: coder)
        }
        func config(width item:Currency, buttonCaculateMin : @escaping () -> Void,buttonCaculateMax : @escaping () -> Void) {
            lblCount.text = "\(item.count)"
            
            if item.type == "Cent" {
                lblCost.text = "¢\(item.number)"
                lblTotalCost.text = "$\(formatNumber(Double(item.number * item.count)/100))"
                if(item.index == 0) {
                    lblCost.backgroundColor = .orange
                    lblCost.layer.cornerRadius = 22.5
                    
                } else {
                    lblCost.layer.cornerRadius = 5
                    lblCost.backgroundColor = .gray
                }
            }
            else {
                lblCost.text = "$\(item.number)"
                lblTotalCost.text = "$\(formatNumber(Double(item.number * item.count)))"
                if item.index == 0 {
                    lblCost.layer.cornerRadius = 22.5
                    lblCost.backgroundColor = .yellow
                } else {
                    lblCost.layer.cornerRadius = 5
                    lblCost.backgroundColor = .green
                }
            }
            
            self.buttonCaculateMin = buttonCaculateMin
            self.buttonCaculateMax = buttonCaculateMax
        }
        @objc private func btnMinAction(){
             buttonCaculateMin?()
        }
        @objc private func btnMaxAction(){
             buttonCaculateMax?()
        }

}
