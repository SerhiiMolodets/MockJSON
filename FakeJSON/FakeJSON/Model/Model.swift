//
//  Model.swift
//  FakeJSON
//
//  Created by Сергей Молодец on 02.09.2022.


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
