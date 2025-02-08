//
//  InfoFoodViewController.swift
//  CountingFood
//
//  Created by AlexTran on 08/02/2025.
//

import UIKit

class InfoFoodViewController: UIViewController {

    
    @IBOutlet weak var btnBack:UIButton!
    @IBOutlet weak var avatarFood: UIImageView!
    @IBOutlet weak var lblNameFood: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var btnMin: UIButton!
    @IBOutlet weak var lblCount: UILabel!
    @IBOutlet weak var btnMax: UIButton!
     
    @IBOutlet weak var lblCustomBtnSubmit: UILabel!
    
    var food:Food?
    var count:Int = 1 {
        didSet {
            lblCount.text = "\(count)"
            lblCustomBtnSubmit.text = "Submit - \(formatPrice(count*food!.price))đ"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblCustomBtnSubmit.text = "Submit - \(formatPrice(count*food!.price))đ"
        lblNameFood.text = food?.name ?? "No data"
        lblPrice.text = formatPrice(food!.price)
        lblCount.text = "\(food?.quantity ?? 1)"
    }
    
    @IBAction func btnMinAction(){
        if count > 1 {count -= 1}
        else {return}
    }
    @IBAction func btnMaxAction(){
        count += 1
    }
    @IBAction func btnBackAction() {
        dismiss(animated: true)
    }

}
