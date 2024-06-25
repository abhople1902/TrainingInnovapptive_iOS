//
//  APIManager.swift
//  NSThreadImageView
//
//  Created by E5000848 on 25/06/24.
//

import Foundation
import UIKit

protocol APIManagerDelegate {
    func didFetchDataFromAPI(_ manager: APIManager, image: UIImage)
    func didFailWithError(error: Error)
}


struct APIManager {
    let imageURLString = "https://images.unsplash.com/photo-1610388558394-974601045c25?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8ZmVycmFyaXxlbnwwfHwwfHx8MA%3D%3D"
    
    var delegate: APIManagerDelegate?
    
    func fetchData(withURL url: String) {
        performRequest(with: url)
    }
    
    func performRequest(with urlString: String) {
        guard let imageURL = URL(string: urlString) else {
            return
        }
        
        var request = URLRequest(url: imageURL)
        request.httpMethod = "GET"
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            if error != nil {
                self.delegate?.didFailWithError(error: error!)
                return
            }
            if let img = UIImage(data: data!) {
                DispatchQueue.main.async {
                    self.delegate?.didFetchDataFromAPI(self, image: img)
                }
            }
            print("Passed")
        }
        task.resume()
    }
}
