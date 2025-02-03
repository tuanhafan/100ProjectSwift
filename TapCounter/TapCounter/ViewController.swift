//
//  ViewController.swift
//  TapCounter
//
//  Created by AlexTran on 03/02/2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbCounter: UILabel!
    @IBOutlet weak var tapButton: UIButton!
    var number :Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Reset", style: .plain, target: self, action: #selector(resetCount))
        lbCounter.text = "\(number)"
    }

    @IBAction func tapAction(_ sender: Any) {
        number = number + 1
        lbCounter.text = "\(number)"
    }
    @objc func resetCount(){
        number = 0
        lbCounter.text = "\(number)"
    }
}

