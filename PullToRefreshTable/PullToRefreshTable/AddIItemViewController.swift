//
//  AddIItemViewController.swift
//  PullToRefreshTable
//
//  Created by AlexTran on 06/02/2025.
//

import UIKit

class AddIItemViewController: UIViewController, UITextFieldDelegate {

    weak var delegateAddItem : AddItemToTbDelegate?
    
    @IBOutlet weak var TftextAddItem: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TftextAddItem.delegate = self
       
    }
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() // Ẩn bàn phím
        if let text = textField.text, !text.isEmpty {
            delegateAddItem?.addItemToTb(text)
        }
        navigationController?.popViewController(animated: true)
        return true
    }
    
    @IBAction func TfAddAction(_ sender: UITextField) {
        
    }
    
}
