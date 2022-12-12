//
//  NetworkManager.swift
//  FakeJSON
//
//  Created by admin on 02.09.2022.
//

import Foundation
import Alamofire

struct NetworkManager {

    static let shared = NetworkManager()
//MARK: Make request
    func getUsers(_ complition: @escaping([UserData]) -> ()) {
        let request = AF.request("https://app.fakejson.com/q", method: .post, parameters: parameters, encoding:  JSONEncoding.default)
        request.responseDecodable(of: [UserData].self) { responce in
            do {
                let users = try responce.result.get()
                complition(users)
            } catch {
                print(error)
            }
        }
    }
    private init() {}
}
