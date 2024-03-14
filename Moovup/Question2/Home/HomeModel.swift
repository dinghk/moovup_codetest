//
//  HomeModel.swift
//  Moovup
//
//  Created by Ding Lo on 13/3/2024.
//

import Foundation

enum HomeModel {
    
    struct UserResponse: Codable {
        let id: String
        let name: Name
        let email: String
        let picture: String
        let location: Location

        enum CodingKeys: String, CodingKey {
            case id = "_id"
            case name
            case email
            case picture
            case location
        }
    }

    struct Name: Codable {
        let last: String
        let first: String
    }

    struct Location: Codable {
        let latitude: Double
        let longitude: Double?
    }
    
}
