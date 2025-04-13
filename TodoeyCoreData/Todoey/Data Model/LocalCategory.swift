//
//  LocalCategory.swift
//  Todoey
//
//  Created by AlexTran on 11/04/2025.
//

import CoreData
protocol LocalCategory {
    //MARK: - Create Context
    var context : NSManagedObjectContext {get}
    
    func saveContext() throws
    
    //MARK: - CRUD Methods
    func createCategory(name:String) throws -> Category
    func fetchCategorys() throws -> [Category]
    func searchCategory(name:String) throws -> [Category]
//    func updateCategory(category:Category) throws
    func deleteCategory(category:Category) throws
    
}
