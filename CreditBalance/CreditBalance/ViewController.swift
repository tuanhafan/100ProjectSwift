//
//  ViewController.swift
//  CreditBalance
//
//  Created by AlexTran on 12/02/2025.
//

import UIKit

struct Recent {
    let avatar: String
    let name :String
    let time:String
    let balance:Double
}

let recents:[Recent] = [
    Recent(avatar: "cup.and.saucer.fill", name: "StarBucks", time: "7:30am", balance: 14.25),
    Recent(avatar: "lock.fill", name: "Henry and Smith", time: "Jul 08, 10:44pm", balance: 155.10),
    Recent(avatar: "hammer.fill", name: "Apple Service", time: "Jul 08, 9:44pm", balance: 220.23),
]

class ViewController: UIViewController {

    @IBOutlet weak var viewHeader: ViewHeader!
    
    @IBOutlet weak var lblrecent: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(CustomCell.self, forCellReuseIdentifier: "cell")
        tableView.rowHeight = 60
        tableView.separatorStyle = .none
    }
    
    
}

extension ViewController : UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recents.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomCell else {
           print("vaof dday")
            return UITableViewCell()
    }
        let recent:Recent = recents[indexPath.row]
        cell.configure(recent: recent)
        return cell
    }
}

class ViewHeader : UIView {
    
     let lblTitle: UILabel = {
          let label = UILabel()
          label.text = "Credit Balance"
          label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
          label.textColor = .white
          return label
      }()

       let lblBalance: UILabel = {
          let label = UILabel()
          label.text = "€32,215"
          label.font = UIFont.boldSystemFont(ofSize: 48)
          label.textColor = .white
          return label
      }()

       let lblTrend: UILabel = {
          let label = UILabel()
          label.text = "⬇ 4.2%"
          label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
          label.textColor = .white
          label.textAlignment = .center
          label.backgroundColor = UIColor.white.withAlphaComponent(0.2)
          label.layer.cornerRadius = 5
          return label
      }()

       let waveImageView: UIImageView = {
          let imageView = UIImageView()
          imageView.image = UIImage(named: "wavesIcon")
          imageView.tintColor = .white
          return imageView
      }()

      override init(frame: CGRect) {
          super.init(frame: frame)
          setupView()
      }

      required init?(coder: NSCoder) {
          super.init(coder: coder)
          setupView()
      }

      private func setupView() {
          self.layer.cornerRadius = 12
          self.clipsToBounds = true
          self.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 40, leading: 40, bottom: 40, trailing: 40)
          addSubview(lblTitle)
          addSubview(lblBalance)
          addSubview(lblTrend)
          addSubview(waveImageView)

          lblTitle.translatesAutoresizingMaskIntoConstraints = false
          lblBalance.translatesAutoresizingMaskIntoConstraints = false
          lblTrend.translatesAutoresizingMaskIntoConstraints = false
          waveImageView.translatesAutoresizingMaskIntoConstraints = false

          NSLayoutConstraint.activate([
                lblTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
                lblTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),

                lblBalance.topAnchor.constraint(equalTo: lblTitle.bottomAnchor, constant: 15),
                lblBalance.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),

                lblTrend.topAnchor.constraint(equalTo: self.topAnchor, constant: 22),
                lblTrend.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -22),
                lblTrend.widthAnchor.constraint(equalToConstant: 60),
                lblTrend.heightAnchor.constraint(equalToConstant: 30),

                waveImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -22),
                waveImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -22),
                waveImageView.widthAnchor.constraint(equalToConstant: 80),
                waveImageView.heightAnchor.constraint(equalToConstant: 30)
          ])
      }
}
