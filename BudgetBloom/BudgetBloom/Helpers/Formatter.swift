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
    formatter.groupingSeparator = ","   // Phân cách phần nghìn bằng dấu `,`
    formatter.decimalSeparator = "."    // Dấu thập phân là `.`
    formatter.minimumFractionDigits = 2 // Luôn có 2 chữ số sau dấu thập phân
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
