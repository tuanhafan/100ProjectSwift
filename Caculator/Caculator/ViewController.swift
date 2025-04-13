//
//  ViewController.swift
//  Caculator
//
//  Created by AlexTran on 14/03/2025.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var stvMain: UIStackView!
    
    @IBOutlet weak var viewlbl: UIView!
    
    @IBOutlet weak var lblNumber: UILabel!
    
    @IBOutlet weak var stv1: UIStackView!
    
    @IBOutlet weak var stv2: UIStackView!
    
    @IBOutlet weak var stv3: UIStackView!
    
    @IBOutlet weak var stv4: UIStackView!
    
    @IBOutlet weak var stv5: UIStackView!
    
    var result : Double = 0
    var resultBtnTapped : String = "" {
        didSet {
            lblNumber.text = resultBtnTapped
            convertArr(resultBtnTapped)
         
        }
    }
    var numbers: [String] = [] 
        
    var operators: [String] = []
    var array: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    private func convertArr(_ text : String) -> Void {
        var currentNumber = ""
        var lastCharWasOpenParen = false // Theo dõi xem ký tự trước có phải là "("
        array = []
        numbers = []
        operators = []
        for char in text {
            if char.isNumber || char == "."  || char == ")" || char == "%"  {
                    currentNumber.append(char)
                    lastCharWasOpenParen = false // Sau số hoặc ký tự khác, không cho phép số âm
                }
            
            else if char == "(" {
                currentNumber.append(char)
                lastCharWasOpenParen = true
            }
            else if char == "-" {
                if lastCharWasOpenParen {
                    currentNumber.append(char)
                    lastCharWasOpenParen = false
                } 
                else {
                    if !currentNumber.isEmpty {
                        array.append(currentNumber)
                        currentNumber = ""
                    }
                    array.append(String(char)) // Tách "-" làm toán tử
                    lastCharWasOpenParen = false
                }
            }
            else {
                    if !currentNumber.isEmpty {
                        array.append(currentNumber)
                        currentNumber = ""
                    }
                    array.append(String(char))
                }
        }
        
        if !(currentNumber.isEmpty) {
            array.append(currentNumber)
        }
        
        for element in array {
            if let number = Double(element) {
                numbers.append(String(number))
            } else if (element.first == Character("(") || element.last == Character("%")) {
                numbers.append(element)
            }
            else {
                operators.append(element)
            }
        }
    }
    
    private func checker(_ text : String) -> Void{
       
        guard let lastChar = array.last else {
                return
            }
        
        
        if lastChar.last == Character(".") {
           return
        }
        
        if (lastChar.last == Character("%") && text == "%" ){
            return
        }
        
        if (lastChar.last == Character("%") || lastChar.last == Character(")") ) && text != "." {
              resultBtnTapped += text
            return
            
        }
        
        if  Double(lastChar) != nil  && text == "."{
            resultBtnTapped += "."
            return
        }
        if !(Double(lastChar) != nil) && (resultBtnTapped.last != "%") {
            
          
            array.removeLast()
            resultBtnTapped.removeLast()
            resultBtnTapped += text
            array.append(text)
            return
        }
        else {
            resultBtnTapped += text
            }
      print (numbers)
        print(operators)
    }
    
    private func checkNegative() {
        guard let lastChar = array.last else {
                return
            }
        
        if lastChar.last == Character(".") {
           return
        }
        if (lastChar.last == Character(")") ) {
            var newString = String(lastChar.dropLast().dropFirst())
            if let range = newString.range(of: "-") {
                newString = newString.replacingCharacters(in: range, with: "")
            } else {
               return
            }
            print(newString)
            array.removeLast()
            array.append(String(newString))
            resultBtnTapped = array.joined(separator: "")
        }
        
        
        if ( Double(lastChar) != nil || lastChar.last == Character("%")){
           
            let newNum = "(-\(String(describing: lastChar)))"
            array.removeLast()
            array.append(newNum)
            resultBtnTapped = array.joined(separator: "")
          
        }
       
    }
   
    private func caculatedNegative(_ number : String) -> Double {
        var numberNew : Double = 0
        print("tính âm : \(number)")
        if number.isEmpty {return 0}
        if (number.first == Character("(") && number.contains("%")) {
            var newString = number
            if let range = newString.range(of: "-") {
                newString = newString.replacingCharacters(in: range, with: "")
            }
            if let range = newString.range(of: "%") {
                newString = newString.replacingCharacters(in: range, with: "")
            }
            if let range = newString.range(of: "(") {
                newString = newString.replacingCharacters(in: range, with: "")
            }
            if let range = newString.range(of: ")") {
                newString = newString.replacingCharacters(in: range, with: "")
            }
            numberNew = -(Double(newString)! / 100)
        }
        else if number.first == Character("(") {
            var newString = String(number.dropLast().dropFirst())
            if let range = newString.range(of: "-") {
                newString = newString.replacingCharacters(in: range, with: "")
            }
            numberNew = -Double(newString)!
        }
        else if ( number.contains("%")) {
            var newString = number
            if let range = newString.range(of: "%") {
                newString = newString.replacingCharacters(in: range, with: "")
            }
            numberNew = (Double(newString)! / 100)
        }
        
        else  {
            numberNew = Double(number)!
        }
        return numberNew
    }
    
    private func caculated() {
        
        
        if (numbers.count <= operators.count) {
             operators.removeLast()
        }
        
        
        result = caculatedNegative(numbers[0])
        
       
        for i in 0..<operators.count  {
            if operators[i] == "x" {
                result *= caculatedNegative(numbers[i + 1])
            } else if operators[i] == "+" {
                result += caculatedNegative(numbers[i + 1])
            } else if operators[i] == "-" {
                result -= caculatedNegative(numbers[i + 1])
            } else {
                result /= caculatedNegative(numbers[i + 1])
            }
        }
        resultBtnTapped = String(result)
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        let tag = sender.tag
        switch tag {
        case 0...9 :
            resultBtnTapped += "\(tag)"
        case 10: // Dấu +
            checker("+")
        case 11 : // Dấu -
            checker("-")
        case 12: // Dấu ×
            checker("x")
        case 13: // Dấu ÷
            checker("÷")
        case 14: // .
            checker(".")
        case 15: // %
            checker("%")
        case 16: // -/+
            checkNegative()
        case 17: // AC
            resultBtnTapped = ""
            array = []
        case 18: // Dấu =
            caculated()
        default:
            return
        }
    }
    
}

