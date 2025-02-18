//
//  User.swift
//  TODOList
//
//  Created by Mark on 18.02.2025.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
