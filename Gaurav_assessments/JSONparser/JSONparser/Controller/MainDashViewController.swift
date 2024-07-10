//
//  MainDashViewController.swift
//  JSONparser
//
//  Created by E5000848 on 04/07/24.
//

import UIKit

protocol ResultTransferDelegate {
    func resultDidGetAttached(_ parsedData: String)
}

class MainDashViewController: UIViewController {
    
    @IBOutlet weak var jsonTextField: UITextField!
    
    var parsingManager = ParsingManager()
    var delegate: ResultTransferDelegate?

    var resultText: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jsonTextField.delegate = self
        parsingManager.delegate = self
        navigationItem.hidesBackButton = true
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(doneClicked))
        jsonTextField.inputAccessoryView = toolbar
        
        toolbar.setItems([flexibleSpace, doneButton], animated: false)
    }
    
    @objc func doneClicked() {
        jsonTextField.endEditing(true)
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
        if let json = jsonTextField.text {
            parser(json)
        }
        performSegue(withIdentifier: "parseDirectly", sender: self)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        jsonTextField.endEditing(true)
        if let json = jsonTextField.text {
            parser(json)
            performSegue(withIdentifier: "parseDirectly", sender: self)
        }
        return true
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

    }
    
    func parser(_ json: String) {
        parsingManager.performParsing(with: json)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let directParseVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController
//        directParseVC?.parsedDataTextView.text = resultText
//    }
}

extension MainDashViewController: ParsingManagerDelegate {
    
    func didParseData(_ parsingManager: ParsingManager, parse: ParseModel) {
        let textToDisplay = """
Racer name is: \(parse.racerName)
Racer number is: \(parse.racerNumber)
Team name is: \(parse.teamName)
This racer has wins: \(parse.raceWins)
"""
        resultText = textToDisplay
        self.delegate?.resultDidGetAttached(resultText)
    }
    
}
