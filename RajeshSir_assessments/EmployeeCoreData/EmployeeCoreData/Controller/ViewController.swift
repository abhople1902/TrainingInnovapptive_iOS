//
//  ViewController.swift
//  EmployeeCoreData
//
//  Created by E5000848 on 19/06/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func goToMainPage(_ sender: UIButton) {
        performSegue(withIdentifier: "ToMainDash", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "ToMainDash") {
            print("Navigated to main dashboard")
        } else {
            print("Wrong identifier")
            return
        }
    }
    
}

