//
//  NetworkConfig.swift
//  Moovup
//
//  Created by Ding Lo on 13/3/2024.
//

import Foundation

// MARK: - Network
class NetworkConfig {
    enum NetworkError: Error {
        case invalidUrl
        case responseFailure
        case serverError(Error)
        case unknownError
    }
    
    enum Method: String {
        case get = "GET"
        case post = "POST"
    }
    
    // Domain
    static var domain = "https://api.json-generator.com"
}
