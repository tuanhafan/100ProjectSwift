//
//  ViewController2.swift
//  PasssDataToView
//
//  Created by AlexTran on 05/02/2025.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var lbText: UILabel!
    var getString : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        lbText.text = getString!.isEmpty ? "no data from View1 " : getString
    }
    

   

}
