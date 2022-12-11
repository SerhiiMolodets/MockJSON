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
    func getRequest(completion: @escaping(([UserData]) -> ())) {
        let request = AF.request("https://app.fakejson.com/q", method: .post, parameters: parameters, encoding:  JSONEncoding.default)
        request.responseDecodable(of: [UserData].self) { responce in
            do {
                let users = try responce.result.get()
                completion(users)
            } catch {
                print(error)
            }
        }
    }
}
