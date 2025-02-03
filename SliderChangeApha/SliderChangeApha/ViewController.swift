//
//  ViewController.swift
//  SliderChangeApha
//
//  Created by AlexTran on 03/02/2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbText: UILabel!
    @IBOutlet weak var sliderAP: UISlider!
    @IBOutlet weak var numberOfAp: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        lbText.alpha = 0.5
        // Do any additional setup after loading the view.
    }

    @IBAction func slderAction(_ sender: UISlider) {
        lbText.alpha = CGFloat(sender.value)
        numberOfAp.text = "\(String(format: "%.1f", sender.value))"
    }
    
}

