//
//  DestinationViewController.swift
//  delegateController
//
//  Created by E5000848 on 03/06/24.
//

import UIKit

protocol DataDelegate: AnyObject {
    func sendData(data: String)
}


class DestinationViewController: UIViewController {
    
    weak var delegate: DataDelegate?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate?.sendData(data: "WWDC")
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
