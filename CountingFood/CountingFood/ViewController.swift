//
//  ViewController.swift
//  CountingFood
//
//  Created by AlexTran on 08/02/2025.
//

import UIKit


struct Food {
    let name: String
    var quantity: Int = 1
    var price: Int
}

public func formatPrice(_ price:Int) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.groupingSeparator = "."
    return formatter.string(from: NSNumber(value: price)) ?? "\(price)"
}

var foods: [Food] = [
    Food(name: "Phở bò", price: 40000),
    Food(name: "Bún chả", price: 35000),
    Food(name: "Cơm tấm", price: 45000),
    Food(name: "Gỏi cuốn", price: 25000),
    Food(name: "Bánh mì", price: 20000),
    Food(name: "Bún bò Huế", price: 50000),
    Food(name: "Mì Quảng", price: 30000),
    Food(name: "Lẩu thái", price: 150000),
    Food(name: "Hủ tiếu", price: 32000),
    Food(name: "Bánh xèo", price: 28000)
]

class ViewController: UIViewController {

    @IBOutlet weak var taleView:UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addFooodAction))
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detail" , let detailVC = segue.destination as? InfoFoodViewController {
            detailVC.food = sender as? Food
        }
        if segue.identifier == "addFood" ,let addFoodVc = segue.destination as? AddFoodViewController {
            addFoodVc.addFood = { [weak self] newFood in
                foods.append(newFood)
                self?.taleView.reloadData()
            }
        }
    }
    
    @IBAction func btnCountAction(_ sender: UIButton) {
        let food:Food = foods[sender.tag]
        performSegue(withIdentifier: "detail", sender: food)
    }
    
    @objc func addFooodAction(){
        
        performSegue(withIdentifier: "addFood", sender: nil)
    }
    
    
    
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let food:Food = foods[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        cell.lblNameFood.text = food.name
        cell.lblPrice.text = "\(formatPrice(food.price))đ"
        cell.btnCount.tag = indexPath.row
        return cell
    }
}



class CustomCell: UITableViewCell  {
    @IBOutlet weak var lblNameFood:UILabel!
    @IBOutlet weak var btnCount: UIButton!
    @IBOutlet weak var lblPrice:UILabel!
    
}
