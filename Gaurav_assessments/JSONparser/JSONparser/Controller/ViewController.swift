//
//  ViewController.swift
//  JSONparser
//
//  Created by E5000848 on 31/05/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func loginPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "moveToLogin", sender: self)
    }
    
    @IBAction func signupPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "moveToSignup", sender: self)
    }
    
    
}
