//
//  ViewController.swift
//  JSONparser
//
//  Created by E5000848 on 31/05/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var jsonTextField: UITextField!
    
    var parsingManager = ParsingManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jsonTextField.delegate = self
        parsingManager.delegate = self
    }
}

extension ViewController: UITextFieldDelegate {
    @IBAction func parsePressed(_ sender: UIButton) {
        jsonTextField.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        jsonTextField.endEditing(true)
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Type Something"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let json = jsonTextField.text {
            parsingManager.performParsing(with: json)
        }
    }
}

extension ViewController: ParsingManagerDelegate {
    func didParseData(_ parsingManager: ParsingManager, parse: ParseModel) {
        print("Racer name is: \(parse.racerName)")
        print("Racer number is: \(parse.racerNumber)")
        print("Team name is: \(parse.teamName)")
        
        print("This racer has wins: \(parse.raceWins)")
    }
}
