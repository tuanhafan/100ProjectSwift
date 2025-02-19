//
//  FormatterAmount.swift
//  BudgetBloom
//
//  Created by AlexTran on 18/02/2025.
//

import Foundation
func formatNumberAmount(_ number: Double) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.groupingSeparator = ","
    formatter.decimalSeparator = "."
    formatter.minimumFractionDigits = 2 
    formatter.maximumFractionDigits = 2
    formatter.negativePrefix = ""
    return "$\(formatter.string(from: NSNumber(value: number)) ?? "0.00" )"
}

func formatDateInExpenseNew(_ date: Date) ->  String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MMM d, yyyy"
    let stringDate = dateFormatter.string(from: date)
    return stringDate
}

func formatDateForAddToData(_ date: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MMMM yyyy"
    let stringDate = dateFormatter.string(from: date)
    return stringDate
}
func formatDateForDateExpense(_ date: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MMM d"
    let stringDate = dateFormatter.string(from: date)
    return stringDate
}
