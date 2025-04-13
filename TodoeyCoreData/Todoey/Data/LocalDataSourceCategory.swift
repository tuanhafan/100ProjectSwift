//
//  LocalDataSourceCategory.swift
//  Todoey
//
//  Created by AlexTran on 11/04/2025.
//

import Foundation
import CoreData

final class CoreDataManagerCategory: LocalCategory {
    
    //MARK: - Sigletion
    static let shared = CoreDataManagerCategory()
    
    private init(){}
    
    //MARK: - Presistent Container
    
    private lazy var presistentContainer : NSPersistentContainer = {
        let container = NSPersistentContainer(name: "DataModel")
        container.loadPersistentStores(completionHandler: { (storeDescription,error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
        }
        })
       return container
    }()
    
    
    //MARK: - Context
    var context: NSManagedObjectContext {
        return presistentContainer.viewContext
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
    
    //MARK: - CRUD Methos
    
    func createCategory(name: String) throws -> Category {
        let category = Category(context:context)
        category.name = name
        saveContext()
        return category
    }
    
    func fetchCategorys() throws -> [Category] {
        let fetchRequest :NSFetchRequest<Category> = Category.fetchRequest()
        do {
           return try context.fetch(fetchRequest)
        } catch {
            fatalError("Unresolved error \(error)")
        }
    }
    
    
    func searchCategory(name: String) throws -> [Category] {
        let fetchRequest: NSFetchRequest<Category> = Category.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "name CONTAINS[cd] %@", name)
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        do {
            return try context.fetch(fetchRequest)
        } catch {
            fatalError("Unresolved error \(error)")
        }
    }
    

    func deleteCategory(category: Category) throws {
        context.delete(category)
        saveContext()
    }
    
    
   
}
