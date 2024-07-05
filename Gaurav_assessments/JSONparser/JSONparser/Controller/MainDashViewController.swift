//
//  MainDashViewController.swift
//  JSONparser
//
//  Created by E5000848 on 04/07/24.
//

import UIKit

class MainDashViewController: UIViewController {
    
    @IBOutlet weak var jsonTextField: UITextField!
    
    var parsingManager = ParsingManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        jsonTextField.delegate = self
        parsingManager.delegate = self
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MainDashViewController: UITextFieldDelegate {
    
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
            let alert = UIAlertController(title: "The text field is empty", message: "Enter valid text", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(action)
            present(alert, animated: true)
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let json = jsonTextField.text {
            parser(json)
        }
    }
    
    func parser(_ json: String) {
        parsingManager.performParsing(with: json)
    }
}

extension MainDashViewController: ParsingManagerDelegate {
    func didParseData(_ parsingManager: ParsingManager, parse: ParseModel) {
        print("Racer name is: \(parse.racerName)")
        print("Racer number is: \(parse.racerNumber)")
        print("Team name is: \(parse.teamName)")
        
        print("This racer has wins: \(parse.raceWins)")
    }
}
