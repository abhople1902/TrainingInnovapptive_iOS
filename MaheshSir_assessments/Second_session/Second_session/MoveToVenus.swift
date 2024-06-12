//
//  MoveToVenus.swift
//  Second_session
//
//  Created by E5000848 on 05/06/24.
//

import Foundation
import UIKit

class MoveToVenus: UIViewController {
    
    @IBOutlet weak var venusTextField: UITextField!
    weak var delegate: DataDelegateSkipOneController?
    
    @IBAction func sendDataToA(_ sender: UIButton) {
        
        self.delegate?.sendDataToOtherController("Ayush>>>>>>")

        
//        if(self.delegate != nil && self.venusTextField.text != nil) {
//            let dataToBeSent = self.venusTextField.text
//            self.delegate?.sendDataToOtherController(dataToBeSent!)
//            dismiss(animated: true, completion: nil)
//        } else {
//            print("Either the delegate is nil or the textfield is empty")
//        }
    }
    
}
