//
//  Model.swift
//  FakeJSON
//
//  Created by Сергей Молодец on 02.09.2022.


import Foundation

/// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let test = try? newJSONDecoder().decode(Test.self, from: jsonData)



import Foundation

// MARK: - UserDatum
struct UserDatum: Codable {
    let user: User
}

// MARK: - User
struct User: Codable {
    let avatar: String
    let email, firstName, lastName, nickname: String

    enum CodingKeys: String, CodingKey {
        case avatar, email
        case firstName = "first_name"
        case lastName = "last_name"
        case nickname
    }
}

typealias UserData = [UserDatum]
