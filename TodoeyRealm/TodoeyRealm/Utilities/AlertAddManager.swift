//
//  AlertManger.swift
//  TodoeyRealm
//
//  Created by Alex Tran on 16/4/25.
//

import UIKit
import RealmSwift

var alertAddManager : (
    _ titleAlert :String,
    _ message : String,
    _ titleActionAdd:String,
    _ placeholder :String,
    _ creatElement : @escaping (_ name: String) -> Void
    
) -> UIAlertController = { (titleAlert,message,titleActionAdd,placeholder,creatElement) in
    
    let alert = UIAlertController(title: titleAlert, message: message, preferredStyle: .alert)
    
    var textField = UITextField()
    
    alert.addTextField { textInput in
        textInput.placeholder = placeholder
        textField = textInput
        
    }
    
    let actionAdd = UIAlertAction(title: titleActionAdd, style: .default) {_ in
        if let textField = textField.text, !textField.isEmpty {
                creatElement(textField)
        }
        
    }
    
    let cancel = UIAlertAction(title: "Cancel", style: .cancel)
    
    alert.addAction(actionAdd)
    alert.addAction(cancel)
    
    return alert
    
}

var alertEditManager : (
    _ titleAlert :String,
    _ message : String,
    _ oldText:String,
    _ ediElement : @escaping (_ name: String) -> Void
) -> UIAlertController = { (titleAlert,message,oldText,ediElement) in
    let alert = UIAlertController(title: titleAlert, message: message, preferredStyle: .alert)
    
    var textField = UITextField()
    
    alert.addTextField { textInput in
        textInput.text = oldText
        textField = textInput
        
    }
    
    let actionAdd = UIAlertAction(title: "Ok", style: .default) {_ in
        if let textField = textField.text, !textField.isEmpty {
            ediElement(textField)
        }
        
    }
    
    let cancel = UIAlertAction(title: "Cancel", style: .cancel)
    
    alert.addAction(actionAdd)
    alert.addAction(cancel)
    
    return alert
}
