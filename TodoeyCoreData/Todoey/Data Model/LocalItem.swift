//
//  LocalDataSource.swift
//  Todoey
//
//  Created by AlexTran on 07/04/2025.
//

import CoreData

protocol LocalItem {
    //MARK: - Create Context
    var context:NSManagedObjectContext {get}
    
    func saveContext() throws
    
    //MARK: - CRUD Methods
    func createItem( category:Category, title:String) throws -> Item
    func fetchItems(category:Category) throws -> [Item]
    func searchItem(textSearch:String, category:Category)throws -> [Item]
//    func UpdateItem(_ item:Item) throws
    func deleteItem(_ item:Item) throws
    
}
