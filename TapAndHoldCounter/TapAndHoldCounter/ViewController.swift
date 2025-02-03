//
//  ViewController.swift
//  TapAndHoldCounter
//
//  Created by AlexTran on 03/02/2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countButton: UIButton!
    @IBOutlet weak var lbcounter: UILabel!
    var number :Int = 0 {
        didSet {
            lbcounter.text = "\(number)"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Reset", style:.plain, target: self, action: #selector(resetCounter))
        
        let tapGesture = UILongPressGestureRecognizer(target: self, action: #selector(gestureButton))
        countButton.addGestureRecognizer(tapGesture)
    }

    @IBAction func counterAction(_ sender: Any) {
        number += 1
    }
    
    
    @objc func resetCounter(){
        number = 0
    }
    @objc func gestureButton() {
        number  += 1
        print("holding")
    }
}

