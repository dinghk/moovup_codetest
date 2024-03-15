//
//  HomeBuilder.swift
//  Moovup
//
//  Created by Ding Lo on 13/3/2024.
//

import Foundation

class HomeBuilder {
    class func create() -> HomeViewController {
        let apiManager = APIManager()
        let viewModel = HomeViewModel(apiManager: apiManager)
        return HomeViewController(viewModel: viewModel)
    }
}
