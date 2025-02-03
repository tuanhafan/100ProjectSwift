//
//  ViewController.swift
//  TipCaculator
//
//  Created by AlexTran on 03/02/2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numberInput: UITextField!
    
    
    @IBOutlet weak var lbTextfield: UILabel!
    
    @IBOutlet weak var lbpercentTip: UILabel!
    
    @IBOutlet weak var lbCountTip: UILabel!
    
    
    @IBOutlet weak var lbTotalMoney: UILabel!
    
    @IBOutlet weak var lbTotalCounter: UILabel!
    
    @IBOutlet weak var ranngeTip: UISlider!
    
    @IBOutlet weak var btnDone: UIButton!
    
    var numberOfTip : Int = 15 {
        didSet {
            
            lbpercentTip.text = "Tip(\(numberOfTip)%)"
            caculatorTip(numberOfTip,valueNumberInput)
        }
    }
    var valueNumberInput : Float = 0.0{
        didSet {
           caculatorTip(numberOfTip,valueNumberInput)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        lbTextfield.isHidden = true
        // Do any additional setup after loading the view.
    }


    @IBAction func rangeAction(_ sender: UISlider) {
        
        numberOfTip = Int(sender.value)
    }
    
    
    @IBAction func inputValue(_ sender: UITextField) {
        print("\(String(describing: sender.text))")
    }
    
    @IBAction func btnDoneAction(_ sender: Any) {
        if let text = numberInput.text, let number = Float(text) {
            valueNumberInput = number
            lbTextfield.text = "$\(String(format:"%.2f", number))"
        } else {
            lbTextfield.text = "$0.00"
        }
       
        lbTextfield.isHidden = false
        numberInput.isHidden = true
    }
    
    func caculatorTip(_ percentTip:Int = 0 ,_ payment:Float = 0.00) {
    
        var totalTip = (Float(percentTip) * payment)/100
        var totalPayment = payment + totalTip
        
        lbCountTip.text = "\(String(format:"%.2f", totalTip))"
        lbTotalCounter.text = "\(String(format:"%.2f", totalPayment))"
        
    }
}

