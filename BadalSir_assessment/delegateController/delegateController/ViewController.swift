//
//  ViewController.swift
//  delegateController
//
//  Created by E5000848 on 02/06/24.
//

import UIKit

class ViewController: UIViewController, DataDelegate {
    func sendData(data: String) {
        print(data)
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let destinationVC = storyboard?.instantiateViewController(withIdentifier: "DestinationViewController") as? DestinationViewController {
            destinationVC.delegate = self
            navigationController?.pushViewController(destinationVC, animated: true)
        }
        
    }


}

