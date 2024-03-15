//
//  HomeViewModel.swift
//  Moovup
//
//  Created by Ding Lo on 13/3/2024.
//

import Foundation

class HomeViewModel {
    private let apiManager: APIManager
    
    init(apiManager: APIManager) {
        self.apiManager = apiManager
    }
}

// MARK: - API
extension HomeViewModel {
    func fetchPeopleListAPI(completion: @escaping ((Result<[HomeModel.UserResponse], NetworkConfig.NetworkError>) -> Void)) {
        
        apiManager.fetchPeopleListAPI { result in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
