//
//  UserEntity.swift
//  FakeJSON
//
//  Created by Сергей Молодец on 11.12.2022.
//

import Foundation
import CoreData

class UserEntity: NSManagedObject {
    class func findOrCreate(_ user : User, context: NSManagedObjectContext) throws -> UserEntity {
//        MARK: - Find and get object from DB
        let request: NSFetchRequest<UserEntity> = UserEntity.fetchRequest()
//        sorting objects by nickName
        request.predicate = NSPredicate(format: "nickname == %d", user.nickname)
        
        do {
            let fetchResult = try context.fetch(request)
            if fetchResult.count > 0 {
//                if assert is not true, then will crash app in only debug mode
                assert(fetchResult.count == 1, "Duplicate has been found in DB!")
                return fetchResult[0]
            }
           
        } catch {
//            throw error to level up
            throw error
        }
//        MARK: - Create new object in DB
        let userEntity = UserEntity(context: context)
        userEntity.nickname = user.nickname
        userEntity.avatar = user.avatar
        userEntity.email = user.email
        userEntity.firstName = user.firstName
        userEntity.lastName = user.lastName
        
        return userEntity
        
    }
}
