//
//  LoginViewController.swift
//  JSONparser
//
//  Created by E5000848 on 05/07/24.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loggedInToBeAuth(_ sender: UIButton) {
        performSegue(withIdentifier: "dashFromLogin", sender: self)
    }
    
    
}
