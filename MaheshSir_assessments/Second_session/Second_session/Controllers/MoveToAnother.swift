//
//  MoveToAnother.swift
//  Second_session
//
//  Created by E5000848 on 03/06/24.
//

import UIKit

class MoveToAnother: UIViewController, DataDelegateSkipOneController {
    
    weak var delegate: DataDelegate?
    weak var delegateA: DataDelegateSkipOneController?

    func sendDataToOtherController(_ data: String?) {
        self.delegate?.sendData(data)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func moveToVenus(_ sender: UIButton) {
        self.performSegue(withIdentifier: "MovingVenus", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MovingVenus" {
            let venusVC: MoveToVenus = segue.destination as! MoveToVenus
            venusVC.delegate = delegateA
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
