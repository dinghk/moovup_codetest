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
    func fetchPeopleListAPI() {
        let urlString = NetworkConfig.domain + "/templates/-xdNcNKYtTFG/data"
            
        guard let url = URL(string: urlString) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = NetworkConfig.Method.get.rawValue
        request.setValue("Bearer b2atclr0nk1po45amg305meheqf4xrjt9a1bo410", forHTTPHeaderField: "Authorization")
            
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error)")
            } else if let data = data {
                do {
                    let jsonData = try JSONSerialization.jsonObject(with: data, options: [])
                    print(jsonData)
                } catch {
                    print("Error: \(error)")
                }
            }
        }
        task.resume()
    }
}
