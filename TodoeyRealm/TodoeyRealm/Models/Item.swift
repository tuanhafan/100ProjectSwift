//
//  Data.swift
//  TodoeyRealm
//
//  Created by Alex Tran on 17/4/25.
//

import Foundation
import RealmSwift

class Item:Object {
    @Persisted(primaryKey: true) var id : String = UUID().uuidString
    @Persisted var name:String = ""
    @Persisted var done:Bool = false
    @Persisted(originProperty: "items") var category: LinkingObjects<Category>
}
