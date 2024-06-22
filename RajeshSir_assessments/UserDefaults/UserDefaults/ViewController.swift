//
//  ViewController.swift
//  UserDefaults
//
//  Created by E5000848 on 11/06/24.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var valueTextField: UITextField!
    
    @IBOutlet weak var keyTextField: UITextField!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func saveToDefaults(_ sender: UIButton) {
        defaults.set(valueTextField.text, forKey: keyTextField.text ?? "Common key")
    }
    
    @IBAction func readFromDefaults(_ sender: UIButton) {
        print(defaults.object(forKey: keyTextField.text ?? "Common key")!)
    }
    
}

