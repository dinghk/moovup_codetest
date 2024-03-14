//
//  UserDetailBuilder.swift
//  Moovup
//
//  Created by Ding Lo on 14/3/2024.
//

import Foundation

class UserDetailBuilder {
    class func create(user: HomeModel.UserResponse) -> UserDetailViewController {
        return UserDetailViewController(user: user)
    }
}
