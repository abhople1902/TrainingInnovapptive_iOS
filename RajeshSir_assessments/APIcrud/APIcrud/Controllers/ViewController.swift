//
//  ViewController.swift
//  APIcrud
//
//  Created by E5000848 on 12/06/24.
//

import UIKit

class ViewController: UIViewController {
    
    var apiManager = APIManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        apiManager.delegate = self
    }

    @IBAction func getProductInfo(_ sender: UIButton) {
        apiManager.fetchData()
    }
    
    @IBAction func putProductInfo(_ sender: UIButton) {
        apiManager.putData()
    }
    
    @IBAction func postProductInfo(_ sender: UIButton) {
        apiManager.postData()
    }
    
    @IBAction func deleteProductInfo(_ sender: UIButton) {
    }

}


extension ViewController: APImanagerDelegate {
    func didFetchDataFromAPI(_ apiManager: APIManager, model: APIModel) {
        DispatchQueue.main.async {
            print(model)
        }
    }
    
    func failedWithError(error: any Error) {
        print(error)
    }
    
    
}
