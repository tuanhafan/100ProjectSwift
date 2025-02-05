//
//  ViewController.swift
//  PasssDataToView
//
//  Created by AlexTran on 05/02/2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var btnDone: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if segue.identifier == "goToVC2" { // Kiểm tra đúng Segue
               if let destinationVC = segue.destination as? ViewController2 {
                   destinationVC.getString = textField.text
               }
               textField.text = ""
           }
       }

    @IBAction func btnPassDataAction(_ sender: UIButton) {
        
    }
}

