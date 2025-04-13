//
//  LocalDataSource.swift
//  Todoey
//
//  Created by AlexTran on 07/04/2025.
//

import Foundation
import CoreData

final class CoreDataManagerItem:LocalItem {
   
    
    
    // MARK: - Singleton
    static let shared = CoreDataManagerItem()
    
    private init(){} // not crate instance anywhere
    
    // MARK: - Persistent Container
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "DataModel")
        container.loadPersistentStores(completionHandler: { (storeDescription,error) in
            
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
            
        })
        
        return container
        
    }()
    //MARK: - Context
    
     var context: NSManagedObjectContext  {
         return persistentContainer.viewContext
    }
    
    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                fatalError("Unresolved error \(error)")
            }
        }
    }
    
    //MARK: - CRUD Context
    
    func createItem(category:Category,title:String) throws -> Item {
        let categoryInContext = context.object(with: category.objectID) as! Category
        let newItem = Item(context:context)
        newItem.id = UUID()
        newItem.title = title
        newItem.done = false
        newItem.parentCategory = categoryInContext
        try context.save()
        return newItem
    }
    
    
    func fetchItems(category:Category) throws -> [Item] {
        let predicate = NSPredicate(format: "parentCategory.name MATCHES %@", category.name!)
        let fetchRequest: NSFetchRequest<Item> = Item.fetchRequest()
        fetchRequest.predicate = predicate
        do {
            return try context.fetch(fetchRequest)
        } catch {
            throw error
        }
    }
    
    func searchItem(textSearch: String,category:Category) throws -> [Item] {
            let categoryPredicate = NSPredicate(format: "parentCategory.name == %@", category.name!)
            let titlePredicate = NSPredicate(format: "title CONTAINS[cd] %@", textSearch)
            let compoundPredicate = NSCompoundPredicate(andPredicateWithSubpredicates: [categoryPredicate, titlePredicate])
            
            let fetchRequest: NSFetchRequest<Item> = Item.fetchRequest()
            fetchRequest.predicate = compoundPredicate
            fetchRequest.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
        do {
            return try context.fetch(fetchRequest)
        } catch{
            throw error
        }
    }
    
//    func UpdateItem(_ item: Item) throws {
//        
//        let id :UUID! = item.id
//        let fetchRequest: NSFetchRequest<Item> = Item.fetchRequest()
//        fetchRequest.predicate = NSPredicate(format: "id == %@", id as NSUUID)
//        
//        do{
//            let results = try context.fetch(fetchRequest)
//            if let itemUpdate = results.first {
//                itemUpdate.title = item.title
//                itemUpdate.done = item.done
//                try context.save()
//            } else {
//                print("Không tìm thấy item với id: \(String(describing: item.id))")
//            }
//            
//        } catch {
//            let error = error as NSError
//            fatalError("Unresolved error \(error), \(error.userInfo)")
//        }
//    }
    
    
    func deleteItem(_ item:Item) throws {
        
        context.delete(item)
        saveContext()
//        let fetchRequest: NSFetchRequest<Item> = Item.fetchRequest()
//        fetchRequest.predicate = NSPredicate(format: "id == %@", id as NSUUID)
//        
//        do {
//            let results = try context.fetch(fetchRequest)
//            if let itemToDelete = results.first {
//                context.delete(itemToDelete)
//                try context.save()
//            } else {
//                print("Không tìm thấy item với id: \(id)")
//            }
//        } catch {
//            let error = error as NSError
//            fatalError("Unresolved error \(error), \(error.userInfo)")
//        }
       
    }
    
    
    
}
