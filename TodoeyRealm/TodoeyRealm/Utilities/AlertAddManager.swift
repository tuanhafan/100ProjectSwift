//
//  AlertAddManager.swift
//  TodoeyRealm
//
//  Created by AlexTran on 13/04/2025.
//

import Foundation
import UIKit

var AlertAddManager : (
   _ titleAlert :String,
   _ message:String,
   _ titleAction:String,
   _ placeholder:String,
//   _ createItem: @escaping (String) throws -> NSManagedObject,
//   _ actionAddNew :@escaping (String) -> Void,
   _ actionReload :@escaping () -> Void
) -> UIAlertController  = { (titleAlert,message,titleAction,placeholderB,actionReload) in
    
    let alert = UIAlertController(title: titleAlert, message: message, preferredStyle: .alert)
    
    var textfield = UITextField()
    
    alert.addTextField { alertTextField in
        alertTextField.placeholder = placeholder
        textfield = alertTextField
    }
    
    let action = UIAlertAction(title: titleAction, style: .default) { _ in
        
        if let getTextField = textfield.text, !getTextField.isEmpty {
              actionReload()
//            do {
//                actionReload()
//            } catch {
//                print("Không tạo được item mới: \(error)")
//            }
        }
        
    }
    
    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
    alert.addAction(action)
    alert.addAction(cancelAction)
    return alert
    
}
