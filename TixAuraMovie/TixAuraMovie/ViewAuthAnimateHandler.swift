//
//  ViewAnimateHandler.swift
//  TixAura
//
//  Created by Alex Tran on 28/4/25.
//

import Foundation
import UIKit



class ViewAuthAnimateHandler: NSObject, UITextFieldDelegate {
    
    private var viewToTextFieldMap :[UIView:(textField:UITextField, label: UILabel)]
    private var lastTappedView:UIView?
    private var lastTextField: UITextField?
    private var stackView:UIStackView?
    private var textFieldOfView : [UITextField:UIView] = [:]
    
    init(viewToTextFieldMap: [UIView : (textField: UITextField, label: UILabel)]) {
        self.viewToTextFieldMap = viewToTextFieldMap
        super.init()
     
    }
    
    
    
    func setupGestureRecognizers() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            for (index, view) in self.viewToTextFieldMap.keys.enumerated() {
                view.tag = index
                view.isUserInteractionEnabled = true
                let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
                view.addGestureRecognizer(tapGesture)
                
                if let (textField, _) = self.viewToTextFieldMap[view] {
                    textField.delegate = self
                    textFieldOfView[textField] = view
                }
            }
        }
    }
    
    
    @objc func handleTap(_ gesture : UITapGestureRecognizer) {
        guard let view = gesture.view , let (textField,label) = viewToTextFieldMap[view] else {
            return
        }
        changeLayout(view: view, textField: textField, label: label)
        removeLayout(view: view)
    }
    
    func changeLayout(view: UIView, textField: UITextField, label: UILabel) {
        textField.isHidden = false
        textField.becomeFirstResponder()
        label.font = UIFont.systemFont(ofSize: 9)
        view.constraints.forEach {
            if $0.firstItem as? UILabel == label  || $0.secondItem as? UILabel == label  {
                return $0.isActive = false
            }
        }
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 5),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10)
        ])
        
        UIView.animate(withDuration: 0.3){
            view.layoutIfNeeded()
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        guard let view = textFieldOfView[textField] else {
            return
        }
        removeLayout(view: view)
    }
    
    func removeLayout(view: UIView?) {
        if let previousView = lastTappedView, previousView != view {
            if let (textField,label) = viewToTextFieldMap[previousView], textField.text!.isEmpty {
                textField.isHidden = true
                textField.resignFirstResponder()	
                label.font = UIFont.systemFont(ofSize: 14)
                previousView.constraints.forEach{
                    if $0.firstItem as? UILabel == label  || $0.secondItem as? UILabel == label  {
                        return $0.isActive = false
                    }
                }
                NSLayoutConstraint.activate([
                    label.centerYAnchor.constraint(equalTo: previousView.centerYAnchor),
                    label.leadingAnchor.constraint(equalTo: previousView.leadingAnchor,constant: 10),
                ])
                
                UIView.animate(withDuration: 0.2) {
                    previousView.layoutIfNeeded()
                }
                lastTextField = textField
            }
        }
        lastTappedView = view
        
    }
//    func reset() {
//        print("here")
//        if let (textField,label) = viewToTextFieldMap[lastTextField!], textField.text!.isEmpty {
//            textField.isHidden = true
//            textField.resignFirstResponder()
//            label.font = UIFont.systemFont(ofSize: 14)
//            lastTextField!.constraints.forEach{
//                if $0.firstItem as? UILabel == label  || $0.secondItem as? UILabel == label  {
//                    return $0.isActive = false
//                }
//            }
//            NSLayoutConstraint.activate([
//                label.centerYAnchor.constraint(equalTo: lastTextField!.centerYAnchor),
//                label.leadingAnchor.constraint(equalTo: lastTextField!.leadingAnchor,constant: 10),
//            ])
//            
//            UIView.animate(withDuration: 0.2) {
//                self.lastTextField!.layoutIfNeeded()
//            }
//
//        }
//    }
}


