//
//  AddNewExPense.swift
//  BudgetBloom
//
//  Created by AlexTran on 18/02/2025.
//

import UIKit

class AddNewExPense: UIViewController {

    @IBOutlet weak var stackViewHeader: UIStackView!
    
    @IBOutlet weak var btnCancel: UIButton!
    
    @IBOutlet weak var lblTitleHeader: UILabel!
    
    @IBOutlet weak var btnSave: UIButton!
    
    @IBOutlet weak var viewAdd: UIView!
    
    @IBOutlet weak var tfNameExpense: UITextField!
    
    @IBOutlet weak var border1: UIView!
    
    @IBOutlet weak var stackViewDate: UIStackView!
    
    @IBOutlet weak var lblDate: UILabel!
    
    @IBOutlet weak var btnGetDate: UIButton!
    
    @IBOutlet weak var border2: UIView!
    
    @IBOutlet weak var lblTypeAmount: UILabel!
    
    @IBOutlet weak var tfAmount: UITextField!
    
    @IBOutlet weak var border3: UIView!
    
    @IBOutlet weak var stackViewCategory: UIStackView!
    
    @IBOutlet weak var btnCategory: UIButton!
    
    @IBOutlet weak var lblNotes: UILabel!
    
    @IBOutlet weak var tfNote: UITextField!
    
    
    var addNew : ((_ key:String, _ expense :Transaction) -> Void)?
    
    var transaction : Transaction =  Transaction(date: "Feb 5", nameExpense: "Credit Card Payment", amount: 337.10)
    var key : String = formatDateForAddToData(Date())
    override func viewDidLoad() {
        super.viewDidLoad()
        viewAdd.layer.cornerRadius = 10
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "datePicker" {
            if let datePickerVc = segue.destination as? CustomDatePicker {
                datePickerVc.addDate = { [weak self] date in
                    let newTitle = NSAttributedString(string: formatDateInExpenseNew(date), attributes: [
                        .font: UIFont.systemFont(ofSize: 14, weight: .regular),
                        .foregroundColor: UIColor.black
                    ])
                    self?.btnGetDate.setAttributedTitle(newTitle, for: .normal)
                    self?.transaction.date = formatDateForDateExpense(date)
                    self?.key = formatDateForAddToData(date)
                }
            }
        }
    }
    
    @IBAction func btnCancelAction(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func btnSaveAction(_ sender: UIButton) {
        addNew?(key,transaction)
        dismiss(animated: true)
    }
    
    @IBAction func btnDateAction(_ sender: UIButton) {
        
    }
    
    @IBAction func tfNameExpense(_ sender: UITextField) {
        transaction.nameExpense = sender.text!
    }
    
    @IBAction func tfAmountAction(_ sender: UITextField) {
        transaction.amount = Double(sender.text!)!
    }
}
