//
//  AddFoodViewController.swift
//  CountingFood
//
//  Created by AlexTran on 08/02/2025.
//

import UIKit

class AddFoodViewController: UIViewController {

    @IBOutlet weak var btnSubmit: UIButton!
    var food:Food = Food(name: "Bun dau mam tom", quantity: 1, price: 35000)
    var addFood: ((Food)-> Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add Food"
    
    }
    
    @IBAction func btnSubmitAction(_ sender: UIButton) {
        addFood?(food)
        navigationController?.popViewController(animated: true)
    }
    
}
