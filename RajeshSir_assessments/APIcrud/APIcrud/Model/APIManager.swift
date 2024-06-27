//
//  APIManager.swift
//  APIcrud
//
//  Created by E5000848 on 12/06/24.
//

import Foundation

protocol APImanagerDelegate {
    func didFetchDataFromAPI (_ apiManager: APIManager, model: APIModel)
    func failedWithError (error: Error)
}

struct APIManager {
    let API_get_url = "https://fakestoreapi.com/products"
    let API_put_url = "https://fakestoreapi.com/products/7"
    let API_post_url = "https://fakestoreapi.com/products"
    
    var delegate: APImanagerDelegate?
    
    func fetchData() {
        performGETRequest(with: API_get_url)
    }
    
    func putData() {
        performPUTRequest(with: API_put_url)
    }
    
    func postData() {
        performPOSTRequest(with: API_post_url)
    }
    
    func performGETRequest(with urlstring: String) {
        if let url = URL(string: urlstring) {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: request) { (data, response, error) in
                if error != nil {
                    self.delegate?.failedWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let maindata = self.parseJSONforOneProduct(safeData) {
                        self.delegate?.didFetchDataFromAPI(self, model: maindata)
                    }
                }
            }
            task.resume()
        }
    }
    
    
    func performPUTRequest(with urlstring: String) {
        if let url = URL(string: urlstring) {
            var request = URLRequest(url: url)
            request.httpMethod = "PUT"
            
            let jsonData = info(id: 95014, title: "Some title", price: 500.00, category: "Electronics", description: "This is updated product", image: "image1")
            
            guard let dataEncoded = try? JSONEncoder().encode(jsonData) else {
                print("Could not encode")
                return
            }
            
            request.httpBody = dataEncoded
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("mobile", forHTTPHeaderField: "platform")
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: request) { (data, response, error) in
                if error != nil {
                    self.delegate?.failedWithError(error: error!)
                    return
                }
                if let httpResponse = response as? HTTPURLResponse {
                    if httpResponse.statusCode == 200 {
                        print("Data updation successful")
                        if let data = data {
                            do {
                                let responseData = try JSONSerialization.jsonObject(with: data, options: [])
                                
                                print("Response Data: \(responseData)")
                            } catch {
                                print("Error parsing response data: \(error)")
                            }
                        }
                    } else {
                        print("HTTP Error: \(httpResponse.statusCode)")
                    }
                }
            }
            task.resume()
        }
    }
    
    
    
    func performPOSTRequest(with urlstring: String) {
        if let url = URL(string: urlstring) {
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            
            let jsonData = info(id: 95014, title: "Some title", price: 5000.00, category: "Electronics", description: "This is updated product", image: "image2")
            
            guard let dataEncoded = try? JSONEncoder().encode(jsonData) else {
                print("Could not encode")
                return
            }
            
            request.httpBody = dataEncoded
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("mobile", forHTTPHeaderField: "platform")
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: request) { (data, response, error) in
                if error != nil {
                    self.delegate?.failedWithError(error: error!)
                    return
                }
                if let httpResponse = response as? HTTPURLResponse {
                    if httpResponse.statusCode == 200 {
                        print("Data creation successful")
                        if let data = data {
                            do {
                                let responseData = try JSONSerialization.jsonObject(with: data, options: [])
                                
                                print("Response Data: \(responseData)")
                            } catch {
                                print("Error parsing response data: \(error)")
                            }
                        }
                    } else {
                        print("HTTP Error: \(httpResponse.statusCode)")
                    }
                }
            }
            task.resume()
        }
    }
    
    //MARK: - Parsing (READING) for one product
    func parseJSONforOneProduct(_ dataToBeParsed: Data) -> APIModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode([info].self, from: dataToBeParsed)
            
            let model = APIModel(product: decodedData)
            
            let id = model.product[0].id
            let title = model.product[0].title
            let price = model.product[0].price
            let category = model.product[0].category
            let image = model.product[0].image
            
            let infoModel = info(id: id, title: title, price: price, category: category, description: "", image: image)
            
            let model2 = APIModel(product: [infoModel])
            
            return model2
            
        } catch {
            self.delegate?.failedWithError(error: error)
            return nil
        }
    }
    
    
    
    
}
