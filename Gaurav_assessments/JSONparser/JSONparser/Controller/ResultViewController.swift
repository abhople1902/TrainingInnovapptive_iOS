//
//  ResultViewController.swift
//  JSONparser
//
//  Created by E5000848 on 05/07/24.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var parsedDataTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Hello")
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Home", style: .plain, target: nil, action: nil)
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

extension ResultViewController: ResultTransferDelegate {
    func resultDidGetAttached(_ parsedData: String) {
        print("Hello")
        parsedDataTextView.text = parsedData
    }
}
