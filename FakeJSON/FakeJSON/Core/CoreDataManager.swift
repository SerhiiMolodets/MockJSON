//
//  CoreDataManager.swift
//  FakeJSON
//
//  Created by Сергей Молодец on 08.12.2022.
//

import Foundation
import CoreData
import UIKit

class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    // MARK: - Core Data stack
    //    A little improovment for using container
    //    static var container: NSPersistentContainer {
    //        return CoreDataManager.shared.persistentContainer
    //    }
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "DataBase")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    private init() {}
    
    func getAllUsers(_ complition: @escaping([User]) -> ()) {
        let viewContext = persistentContainer.viewContext
        viewContext.perform {
            let userEntities = try? UserEntity.all(viewContext)
            let users = userEntities?.map { User(entity: $0) }
            complition(users ?? [])
        }
    }
    func save(users: [User], _ complition: @escaping () -> ()) {
        let viewContext = persistentContainer.viewContext
        users.forEach { user in
         _ =  try? UserEntity.findOrCreate(user, viewContext)
        }
        try? viewContext.save()
        
        complition()
    }
    
    
}
