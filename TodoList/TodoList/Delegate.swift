//
//  Delegate.swift
//  TodoList
//
//  Created by AlexTran on 07/02/2025.
//

import Foundation
protocol AddPersonDelegate : AnyObject {
    func addPerson(_ person:Person)
}
