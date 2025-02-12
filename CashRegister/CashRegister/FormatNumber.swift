//
//  FormatNumber.swift
//  CashRegister
//
//  Created by AlexTran on 12/02/2025.
//

import Foundation
func formatNumber(_ number: Double) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.minimumFractionDigits = 2
    formatter.usesGroupingSeparator = false
    return formatter.string(from: NSNumber(value: number)) ?? "\(number)"
}
func formatNumberGrand(_ number: Double) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.groupingSeparator = ","   // Phân cách phần nghìn bằng dấu `,`
    formatter.decimalSeparator = "."    // Dấu thập phân là `.`
    formatter.minimumFractionDigits = 2 // Luôn có 2 chữ số sau dấu thập phân
    formatter.maximumFractionDigits = 2
    formatter.negativePrefix = ""  
    return formatter.string(from: NSNumber(value: number)) ?? "0.00"
}
