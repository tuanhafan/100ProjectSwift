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
    let viewCellHeader : UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        view.clipsToBounds = true
        view.backgroundColor = .systemBlue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let lblTitleHeader: UILabel = {
         let label = UILabel()
         label.text = "Credit Balance"
         label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
         label.textColor = .white
         return label
     }()

      let lblBalanceHeader: UILabel = {
         let label = UILabel()
         label.text = "€32,215"
         label.font = UIFont.boldSystemFont(ofSize: 48)
         label.textColor = .white
         return label
     }()

      let lblTrendHeader: UILabel = {
         let label = UILabel()
         label.text = "⬇ 4.2%"
         label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
         label.textColor = .white
         label.textAlignment = .center
         label.backgroundColor = UIColor.white.withAlphaComponent(0.2)
         label.layer.cornerRadius = 5
         return label
     }()

      let waveImageViewHeader: UIImageView = {
         let imageView = UIImageView()
         imageView.image = UIImage(named: "wavesIcon")
         imageView.tintColor = .white
         return imageView
     }()

    func setUpCellContent() {
        viewAva.addSubview(avatar)
        stackView.addArrangedSubview(lblName)
        stackView.addArrangedSubview(lblTime)
        
        contentView.addSubview(viewAva)
        contentView.addSubview(stackView)
        contentView.addSubview(lblBalance)
        
        NSLayoutConstraint.activate([
            
            contentView.heightAnchor.constraint(greaterThanOrEqualToConstant: 60),

            
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
    func setUpHeaderCell() {
       
        
        
        viewCellHeader.addSubview(lblTitleHeader)
        viewCellHeader.addSubview(lblBalanceHeader)
        viewCellHeader.addSubview(lblTrendHeader)
        viewCellHeader.addSubview(waveImageViewHeader)
        contentView.addSubview(viewCellHeader)

        lblTitleHeader.translatesAutoresizingMaskIntoConstraints = false
        lblBalanceHeader.translatesAutoresizingMaskIntoConstraints = false
        lblTrendHeader.translatesAutoresizingMaskIntoConstraints = false
        waveImageViewHeader.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            viewCellHeader.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            viewCellHeader.heightAnchor.constraint(equalToConstant: 150),
            
            lblTitleHeader.topAnchor.constraint(equalTo: viewCellHeader.topAnchor, constant: 20),
            lblTitleHeader.leadingAnchor.constraint(equalTo: viewCellHeader.leadingAnchor, constant: 30),

            lblBalanceHeader.topAnchor.constraint(equalTo: lblTitleHeader.bottomAnchor, constant: 15),
            lblBalanceHeader.leadingAnchor.constraint(equalTo: viewCellHeader.leadingAnchor, constant: 30),

            lblTrendHeader.topAnchor.constraint(equalTo: viewCellHeader.topAnchor, constant: 22),
            lblTrendHeader.trailingAnchor.constraint(equalTo: viewCellHeader.trailingAnchor, constant: -22),
            lblTrendHeader.widthAnchor.constraint(equalToConstant: 60),
            lblTrendHeader.heightAnchor.constraint(equalToConstant: 30),

            waveImageViewHeader.trailingAnchor.constraint(equalTo: viewCellHeader.trailingAnchor, constant: -22),
            waveImageViewHeader.bottomAnchor.constraint(equalTo: viewCellHeader.bottomAnchor, constant: -22),
            waveImageViewHeader.widthAnchor.constraint(equalToConstant: 80),
            waveImageViewHeader.heightAnchor.constraint(equalToConstant: 30)
        ])
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
    }
   
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    func configure(recent item:Recent? = nil,typeCell:String){
        if(typeCell ==  "Content"){
            setUpCellContent()
            avatar.image = UIImage(systemName: "\(item!.avatar)")
            lblName.text = "\(item!.name)"
            lblTime.text = "\(item!.time)"
            lblBalance.text = "€\(item!.balance)"
        } else {
            setUpHeaderCell()
        }
       
    }
}
