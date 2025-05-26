//
//  Category.swift
//  TodoeyRealm
//
//  Created by Alex Tran on 17/4/25.
//

import Foundation
import RealmSwift

class Category:Object {
    @Persisted(primaryKey: true) var id:String = UUID().uuidString
    @Persisted var name:String = ""
    @Persisted var items = List<Item>()
}
