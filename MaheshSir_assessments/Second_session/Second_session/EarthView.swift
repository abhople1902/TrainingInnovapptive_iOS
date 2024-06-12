//
//  EarthView.swift
//  Second_session
//
//  Created by E5000848 on 30/05/24.
//

import UIKit

protocol ButtonTapDelegate: AnyObject {
    func moveToEarthTapped()
    func moveAnotherTapped()
}

class EarthView: UIView {
    @IBOutlet weak var MoveToAnother: UIButton!
    
    @IBOutlet weak var MoveToEarth: UIButton!
    
    weak var delegate: ButtonTapDelegate?

    

    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
