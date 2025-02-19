//
//  Data.swift
//  BudgetBloom
//
//  Created by AlexTran on 17/02/2025.
//

import Foundation
var transactions: [String: [Transaction]] = [
    "February 2025": [
        Transaction(date: "Feb 5", nameExpense: "Credit Card Payment", amount: 337.10),
        Transaction(date: "Feb 5", nameExpense: "Target", amount: 28.34),
        Transaction(date: "Feb 4", nameExpense: "Netflix Subscription", amount: 15.99),
        Transaction(date: "Feb 4", nameExpense: "Gym Membership", amount: 40.00),
        Transaction(date: "Feb 3", nameExpense: "Starbucks", amount: 5.50),
        Transaction(date: "Feb 3", nameExpense: "Amazon Prime", amount: 14.99),
        Transaction(date: "Feb 2", nameExpense: "Whole Foods Market", amount: 22.10),
        Transaction(date: "Feb 2", nameExpense: "Uber Ride", amount: 18.75),
        Transaction(date: "Feb 1", nameExpense: "Rent", amount: 2000.00),
        Transaction(date: "Feb 1", nameExpense: "Gas", amount: 45.00),
    ],
    "January 2025": [
        Transaction(date: "Jan 31", nameExpense: "Spotify Premium", amount: 9.99),
        Transaction(date: "Jan 30", nameExpense: "Electric Bill", amount: 120.50),
        Transaction(date: "Jan 28", nameExpense: "Grocery Shopping", amount: 75.20),
        Transaction(date: "Jan 27", nameExpense: "Groomer", amount: 100.01),
        Transaction(date: "Jan 26", nameExpense: "DTE Energy", amount: 185.90),
    ]
]
