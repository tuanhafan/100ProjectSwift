//
//  RealmManagẻ.swift
//  TodoeyRealm
//
//  Created by Alex Tran on 17/4/25.
//

import Foundation
import RealmSwift

class RealmManager {
    static let shared = RealmManager()
    
    private init() {}
    
    private func getRealm() throws -> Realm {
        return try Realm()
    }
    
    // MARK: - CRUD Methods
    
    //Create
    func create<T:Object>(_ object: T) throws {
        let realm = try getRealm()
        try realm.write{
            realm.add(object)
        }
    }
    
    func createChild<Child: Object, Parent:Object>(
        ofParentType parentType: Parent.Type,
        child:Child,
        parentId:String,
        relationshipProperty: String
    ) throws {
        let realm = try getRealm()
        guard let parent = realm.object(ofType: parentType.self, forPrimaryKey: parentId) else {
            print("Person không tồn tại")
            return
        }
        
        guard let listChild = parent.value(forKey: relationshipProperty) as? List<Child> else {
            throw NSError(
                domain: "",
                code: -2,
                userInfo: [NSLocalizedDescriptionKey: "Thuộc tính \(relationshipProperty) không tồn tại)>"]
            )
        }
        
        try realm.write {
            listChild.append(child)
        }
        
        
    }
    
    // Read
    func readParents<T: Object>(_ type: T.Type, filter : String? = nil) throws -> [T]{
        let realm = try getRealm()
        if let filter = filter, !filter.isEmpty {
            return Array(realm.objects(type).filter(filter))
        }
        return Array(realm.objects(type))
    }
    
    func readChidren<Parent:Object, Child:Object>(
        ofParentType parentType : Parent.Type,
        childType: Child.Type,
        parentId: String,
        relationshipProperty: String,
        filter:String? = nil
    ) throws -> [Child] {
        let realm = try getRealm()
        
        guard let parent = realm.object(ofType: Parent.self, forPrimaryKey: parentId) else {
            throw NSError(
                domain: "",
                code: -1,
                userInfo: [NSLocalizedDescriptionKey: "\(parentType) không tồn tại"]
            )
        }
        
        // Truy xuất thuộc tính quan hệ (List<Child>)
        guard let listChild = parent.value(forKey: relationshipProperty) as? List<Child> else {
            throw NSError(
                domain: "",
                code: -2,
                userInfo: [NSLocalizedDescriptionKey: "Thuộc tính \(relationshipProperty) không phải List<\(childType)>"]
            )
        }
        if let filter = filter, !filter.isEmpty {
            return Array(listChild.filter(filter))
        }
        return Array(listChild)
    }
    
    // Delete
    
    func deleteParent<Parent: Object, Child: Object>(
        ofParentType parentType: Parent.Type,
        childType: Child.Type,
        parentId: String,
        relationshipProperty: String
    ) throws {
        let realm = try getRealm()
        guard let parent = realm.object(ofType: parentType, forPrimaryKey: parentId) else {
            throw NSError(
                domain: "",
                code: -1,
                userInfo: [NSLocalizedDescriptionKey: "\(parentType) không tồn tại"]
            )
        }
        guard let list = parent.value(forKey: relationshipProperty) as? List<Child> else {
            throw NSError(
                domain: "",
                code: -2,
                userInfo: [NSLocalizedDescriptionKey: "Thuộc tính \(relationshipProperty) không phải List<\(childType)>"]
            )
        }
        try realm.write {
            // Xóa tất cả children
            realm.delete(list)
            // Xóa parent
            realm.delete(parent)
        }
    }
    
    func delete<T: Object>(_ object: T) throws {
         let realm = try getRealm()
          try realm.write {
              realm.delete(object)
        }
      }
    
    // Update
    
    func update<T:Object>(_ object:T, name: String) throws {
        let realm = try getRealm()
        try realm.write {
               object.setValue(name, forKey: "name")
        }

    }
}


//class RealmManager {
//    // Singleton
//    static let shared = RealmManager()
//
//    private init() {}
//
//    // Tạo instance Realm mới cho mỗi thread
//    private func getRealm() throws -> Realm {
//        return try Realm()
//    }
//
//    // MARK: - Create
//    func create<T: Object>(_ object: T) throws {
//        let realm = try getRealm()
//        try realm.write {
//            realm.add(object)
//        }
//    }
//
//    // MARK: - Read
//    func read<T: Object>(_ type: T.Type, filter: String? = nil) throws -> Results<T> {
//        let realm = try getRealm()
//        if let filter = filter {
//            return realm.objects(type).filter(filter)
//        }
//        return realm.objects(type)
//    }
//
//    // MARK: - Update
//    func update<T: Object>(_ object: T, with updates: [String: Any]) throws {
//        let realm = try getRealm()
//        try realm.write {
//            for (key, value) in updates {
//                object.setValue(value, forKey: key)
//            }
//        }
//    }
//
//    // MARK: - Delete
//    func delete<T: Object>(_ object: T) throws {
//        let realm = try getRealm()
//        try realm.write {
//            realm.delete(object)
//        }
//    }
//
//    // Xóa tất cả object của một loại
//    func deleteAll<T: Object>(_ type: T.Type) throws {
//        let realm = try getRealm()
//        try realm.write {
//            let objects = realm.objects(type)
//            realm.delete(objects)
//        }
//    }
//}
