//
//  DataManager.swift
//  FakeJSON
//
//  Created by Сергей Молодец on 08.12.2022.
//

import Foundation

class DataManager {
    let coreDataManager = CoreDataManager.shared
    let networkManager = NetworkManager.shared
    
    func getUsers(_ complition: @escaping([User]) -> ()) {
        coreDataManager.getAllUsers { (dbUsers) in
            if dbUsers.count > 0 {
                complition(dbUsers)
            } else {
                self.networkManager.getUsers { (userData) in
                    let netUsers = userData.map { $0.user }
                    //                    save to DB
                    self.coreDataManager.save(users: netUsers) {
                        complition(netUsers)
                    }
                }
            }
        }
    }
    
    
}
