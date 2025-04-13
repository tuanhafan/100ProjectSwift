//
//  AlertCreateNewElement.swift
//  Todoey
//
//  Created by AlexTran on 11/04/2025.
//

import Foundation
import UIKit
import CoreData

let CustomAlertAddnew : (
    _ titleAlert:String,
    _ message:String,
    _ tileAction:String,
    _ placeholder:String,
    _ createItem: @escaping (String) throws -> NSManagedObject,
    _ appendItem: @escaping (NSManagedObject) -> Void,
    _ reloadData: @escaping () -> Void
) -> UIAlertController = { (titleAlert, message, tileAction,placeholder, createItem, appendItem, reloadData) in
    
    print("tạo alert")
    var textField = UITextField()
    
    let alert = UIAlertController(title: titleAlert, message: message, preferredStyle: .alert)
    
    alert.addTextField { alertTextField in
        alertTextField.placeholder = placeholder
        textField = alertTextField
    }
    
    let action = UIAlertAction(title: tileAction, style: .default) {_ in
        if let textFieldItem = textField.text, !textFieldItem.isEmpty {
            do {
                let newItem = try createItem(textFieldItem)
                appendItem(newItem)
                reloadData()
            } catch {
                print("Không tạo được item mới")
            }
        }
    }
    
    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
    alert.addAction(action)
    alert.addAction(cancelAction)
    return alert
    
}
