//
//  ViewController.swift
//  Second_session
//
//  Created by E5000848 on 30/05/24.
//

import UIKit

class ViewController: UIViewController, ButtonTapDelegate, DataDelegate, DataDelegateSkipOneController {
    
    @IBOutlet weak var dataFromEarth: UILabel!
    
    @IBOutlet weak var dataFromVenus: UILabel!
    
    func sendData(_ data: String?) {
        dataFromEarth.text = data ?? "No data received yet"
    }
    
    func sendDataToOtherController(_ data: String?) {
        dataFromVenus.text = data ?? "No data received yet"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let nib1 = UINib(nibName: "EarthView", bundle: nil)
        if let view1 = nib1.instantiate(withOwner: self, options: nil).first as? EarthView {
            view1.delegate = self
            view1.MoveToAnother.addTarget(self, action: #selector(moveAnotherTapped), for: .touchUpInside)
            view1.MoveToEarth.addTarget(self, action: #selector(moveToEarthTapped), for: .touchUpInside)
            view1.frame = CGRect(x: 10, y: 300, width: 357, height: 90)
            self.view.addSubview(view1)
        }
    }
    
    
    @objc func moveToEarthTapped() {
//        let earthVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MoveToEarth") as? MoveToEarth
        
        self.performSegue(withIdentifier: "MovingEarth", sender: self)
    }
    
    @objc func moveAnotherTapped() {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MoveToAnother") as? MoveToAnother
        vc?.delegate = self
        vc?.delegateA = self
        
        self.navigationController?.pushViewController(vc ?? UIViewController(), animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MovingEarth" {
            let earthVC: MoveToEarth = segue.destination as! MoveToEarth
            earthVC.delegate = self
            
        }
    }


}

