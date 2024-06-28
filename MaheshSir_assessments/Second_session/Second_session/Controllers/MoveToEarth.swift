//
//  MoveToEarth.swift
//  Second_session
//
//  Created by E5000848 on 03/06/24.
//

import UIKit


class MoveToEarth: UIViewController {
    
    @IBOutlet weak var earthTextField: UITextField!
    weak var delegate: DataDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func sendFromEarth(_ sender: UIButton) {
        if(self.delegate != nil && self.earthTextField.text != nil) {
            let dataToBeSent = self.earthTextField.text
            self.delegate?.sendData(dataToBeSent!)
            dismiss(animated: true, completion: nil)
        } else {
            print("Either the delegate is nil or the textfield is empty")
        }
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
