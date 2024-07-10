//
//  APIManager.swift
//  JSONparser
//
//  Created by E5000848 on 05/07/24.
//

import Foundation

protocol APIManagerDelegate {
    func didFailCallingWithError(_ error: Error)
}

struct APIManager {
    
    var delegate: APIManagerDelegate?
    
    func callAPI(with urlString: String) {
        if let url = URL(string: urlString) {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: request) { (data, response, error) in
                if (error != nil) {
                    print(error?.localizedDescription ?? "No error captured")
                    self.delegate?.didFailCallingWithError(error!)
                    return
                }
                if let safeData = data {
                    
                }
            }
        }
    }
}
