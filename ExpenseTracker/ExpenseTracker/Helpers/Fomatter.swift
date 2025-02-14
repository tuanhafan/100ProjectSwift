//
//  Fomatter.swift
//  ExpenseTracker
//
//  Created by AlexTran on 14/02/2025.
//

import Foundation
func formatNumberGrand(_ number: Double) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.groupingSeparator = ","
    formatter.decimalSeparator = "."
    formatter.minimumFractionDigits = 2
    formatter.maximumFractionDigits = 2
    formatter.negativePrefix = ""
    return formatter.string(from: NSNumber(value: number)) ?? "0.00"
}
