//
//  CustomDatePicker.swift
//  BudgetBloom
//
//  Created by AlexTran on 18/02/2025.
//

import UIKit

class CustomDatePicker: UIViewController {

    @IBOutlet weak var btnCancel: UIButton!
    
    @IBOutlet weak var datePickerView: UIDatePicker!
    
    @IBOutlet weak var btnSubmit: UIButton!
    
    var addDate :((_ date : Date) -> Void)?
    var getDate : Date = Date()
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    @IBAction func valueChange(_ sender: UIDatePicker) {
        let selectDate = sender.date
        getDate = selectDate
    }
    
    @IBAction func submitAction(_ sender: UIButton) {
        addDate?(getDate)
        dismiss(animated: true)
    }
    
    @IBAction func btnCancelAction(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}
