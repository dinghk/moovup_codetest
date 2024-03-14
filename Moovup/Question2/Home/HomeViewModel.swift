//
//  HomeViewModel.swift
//  Moovup
//
//  Created by Ding Lo on 13/3/2024.
//

import Foundation

class HomeViewModel {
    
}

// MARK: - API
extension HomeViewModel {
    func fetchPeopleListAPI(completion: @escaping ((Result<[HomeModel.UserResponse], NetworkConfig.NetworkError>) -> Void)) {
        let urlString = NetworkConfig.domain + "/templates/-xdNcNKYtTFG/data"
            
        guard let url = URL(string: urlString) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = NetworkConfig.Method.get.rawValue
        request.setValue("Bearer b2atclr0nk1po45amg305meheqf4xrjt9a1bo410", forHTTPHeaderField: "Authorization")
            
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(.serverError(error)))
            } else {
                if let data = data {
                    do {
                        let userResponse = try JSONDecoder().decode([HomeModel.UserResponse].self, from: data)
                        completion(.success(userResponse))
                        
                    } catch {
                        completion(.failure(.responseFailure))
                    }
                } else {
                    completion(.failure(.unknownError))
                }
            }
        }
        task.resume()
    }
}
