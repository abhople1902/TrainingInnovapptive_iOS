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
    let APIurl = "https://fakestoreapi.com/products"
    
    var delegate: APImanagerDelegate?
    
    func fetchData() {
        performRequest(with: APIurl)
    }
    
    func performRequest(with urlstring: String) {
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
