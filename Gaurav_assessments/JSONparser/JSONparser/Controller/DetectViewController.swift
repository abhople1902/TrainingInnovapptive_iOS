//
//  DetectViewController.swift
//  JSONparser
//
//  Created by E5000848 on 05/07/24.
//

import UIKit
import Foundation

class DetectViewController: UIViewController {

    var delegate: APIManagerDelegate?
    
    @IBOutlet weak var linkTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    func callAPI(with urlString: String) {
        if let url = URL(string: urlString) {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: request) { (data, response, error) in
                if error != nil {
                    print(error?.localizedDescription ?? "")
                    self.delegate?.didFailCallingWithError(error!)
                    return
                }
                
            }
            task.resume()
        }
  
    }
    

}
