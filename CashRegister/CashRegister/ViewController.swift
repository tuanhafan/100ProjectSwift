//
//  ViewController.swift
//  CashRegister
//
//  Created by AlexTran on 11/02/2025.
//

import UIKit

struct Currency {
    let number: Int
    let type: String
    let index :Int
    var count:Int
}
var data:[String:[Int]] = [
    "Cent" : [1,5,10,15,20],
    "Dollar": [1,1,2,5,10]
]
//let currency :[Currency] = [
//    Currency(number: 1, type: "Cent", index: 0, count: 1),
//    Currency(number: 5, type: "Cent", index: 1, count: 1),
//    Currency(number: 10, type: "Cent", index: 2, count: 1),
//    Currency(number: 15, type: "Cent", index: 3, count: 1),
//    Currency(number: 20, type: "Cent", index: 4, count: 1),
//    Currency(number: 1, type: "Dollar", index: 0, count: 1),
//    Currency(number: 1, type: "Dollar", index: 1, count: 1),
//    Currency(number: 2, type: "Dollar", index: 2, count: 1),
//    Currency(number: 5, type: "Dollar", index: 3, count: 1),
//    Currency(number: 10, type: "Dollar", index: 4, count: 1)
//]
let oldCurrency: [Currency] = data.sorted { $0.key < $1.key }.flatMap { (key, values) in
    values.enumerated().map {(index,value)in  Currency(number: value, type: key, index: index , count:0) }
}
var currencyArray :[Currency] = oldCurrency
class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    private var lblNUmberGrand: UILabel!
    var totalGrand : Double = 0 {
        didSet {
            lblNUmberGrand.text = "$\(formatNumberGrand(totalGrand))"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = createFooterView()
        tableView.register(CustomCellViewController.self, forCellReuseIdentifier: "cell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.rowHeight = 60

        let closeButton = UIBarButtonItem(
            image: UIImage(systemName: "x.circle.fill")?.withRenderingMode(.alwaysTemplate),
            style: .plain,
            target: self,
            action: #selector(closeAction)
        )
        let detailButton = UIBarButtonItem(
            image: UIImage(systemName: "ellipsis.circle.fill")?.withRenderingMode(.alwaysTemplate),
            style: .plain,
            target: self,
            action: #selector(closeAction)
        )
        closeButton.tintColor = .green
        navigationItem.leftBarButtonItem = closeButton
        detailButton.tintColor = .green
        navigationItem.rightBarButtonItem = detailButton
        
    }
    
    
    func createFooterView() -> UIStackView {
        let footerView = UIStackView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 50))
        footerView.backgroundColor = .white
        footerView.alignment = .center
        footerView.spacing = 10
        footerView.axis = .horizontal
        let viewLeftBottom = UIView()
        let lblTitleGrand = UILabel()
        lblNUmberGrand = UILabel()
        
        lblTitleGrand.textColor = .lightGray
        lblTitleGrand.font = UIFont.systemFont(ofSize: 12)
        lblTitleGrand.textAlignment = .right
        lblNUmberGrand.textAlignment = .right
        lblNUmberGrand.font = UIFont.systemFont(ofSize: 24)

        lblTitleGrand.text = "Grand Total"
        lblNUmberGrand.text = "$\(totalGrand)"
        
        
        
        let borderView = UIView()
        borderView.backgroundColor = .lightGray
        
    
    
        let stackViewRightBottom = UIStackView()
        let btnFile = UIButton()
        let btnClear = UIButton()
        
        stackViewRightBottom.axis = .horizontal
        stackViewRightBottom.spacing = 8
        
      
        btnFile.setImage(UIImage(systemName: "xmark.circle.fill",withConfiguration: UIImage.SymbolConfiguration(pointSize: 35)), for: .normal)
        btnFile.tintColor = .blue
        btnClear.setImage(UIImage(systemName: "xmark.circle.fill",withConfiguration: UIImage.SymbolConfiguration(pointSize: 35)), for: .normal)
        btnClear.tintColor = .red
        btnClear.addTarget(self, action: #selector(clearCurrency), for: .touchUpInside)
        
        viewLeftBottom.addSubview(lblTitleGrand)
        viewLeftBottom.addSubview(lblNUmberGrand)
        stackViewRightBottom.addArrangedSubview(borderView)
        stackViewRightBottom.addArrangedSubview(btnFile)
       
        stackViewRightBottom.addArrangedSubview(btnClear)
     
       
        lblTitleGrand.translatesAutoresizingMaskIntoConstraints = false
        lblNUmberGrand.translatesAutoresizingMaskIntoConstraints = false
        borderView.translatesAutoresizingMaskIntoConstraints = false
        btnClear.translatesAutoresizingMaskIntoConstraints = false
    
        NSLayoutConstraint.activate([
            
            
            lblTitleGrand.topAnchor.constraint(equalTo: viewLeftBottom.topAnchor),
            lblTitleGrand.trailingAnchor.constraint(equalTo: viewLeftBottom.trailingAnchor),

            lblNUmberGrand.topAnchor.constraint(equalTo: lblTitleGrand.bottomAnchor, constant: 4),
            lblNUmberGrand.trailingAnchor.constraint(equalTo: viewLeftBottom.trailingAnchor),
            lblNUmberGrand.bottomAnchor.constraint(equalTo: viewLeftBottom.bottomAnchor),
         
            
            
            borderView.widthAnchor.constraint(equalToConstant: 1),

        ])
           
        
        footerView.addArrangedSubview(viewLeftBottom)
        footerView.addArrangedSubview(stackViewRightBottom)
        return footerView
    }
    
  
    
    @objc func closeAction(){
        
    }
    @objc func clearCurrency(){
        currencyArray = oldCurrency
        totalGrand = 0
        tableView.reloadData()
    }
}

extension ViewController :UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencyArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomCellViewController else {
            return UITableViewCell()
        }
        let item:Currency = currencyArray[indexPath.row]
        cell.config(width: item,buttonCaculateMin: {
            if(currencyArray[indexPath.row].count > 0 && currencyArray[indexPath.row].type == "Cent"){
                currencyArray[indexPath.row].count -= 1
                self.totalGrand = self.totalGrand - (Double(currencyArray[indexPath.row].number)  / 100)
            } else if ( currencyArray[indexPath.row].count > 0) {
                currencyArray[indexPath.row].count -= 1
                self.totalGrand = self.totalGrand - Double(currencyArray[indexPath.row].number)
            }
            tableView.reloadData()
        },buttonCaculateMax: {
            currencyArray[indexPath.row].count += 1
            if(currencyArray[indexPath.row].type == "Cent") {
                self.totalGrand = self.totalGrand + (Double(currencyArray[indexPath.row].number) / 100)
            } else {
                self.totalGrand = self.totalGrand + Double(currencyArray[indexPath.row].number)
            }
            
            tableView.reloadData()
        })
       
        return cell
    }
}



