//
//  UIImageView+Extension.swift
//  Moovup
//
//  Created by Ding Lo on 14/3/2024.
//

import Foundation
import UIKit

extension UIImageView {
    func loadImage(from urlString: String, completion: (() -> Void)? = nil) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, let image = UIImage(data: data), error == nil else {
                completion?()
                return
            }
            
            DispatchQueue.main.async {
                self?.image = image
                completion?()
            }
        }.resume()
    }
}
