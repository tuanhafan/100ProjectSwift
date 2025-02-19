//
//  DataManager.swift
//  BudgetBloom
//
//  Created by AlexTran on 18/02/2025.
//

import Foundation
var transactionData: [String: [Transaction]] = transactions
var sectionTitle: [String] = Array(transactionData.keys).sorted{$0 < $1}

