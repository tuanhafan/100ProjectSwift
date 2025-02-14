//
//  CustomCellHeader.swift
//  CreditBalance
//
//  Created by AlexTran on 13/02/2025.
//

import UIKit

class CustomCellHeader: UITableViewCell {

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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
            
            
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
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
