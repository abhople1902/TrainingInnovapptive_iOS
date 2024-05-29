//
//  ViewController.swift
//  ProgrammaticUI1
//
//  Created by E5000848 on 29/05/24.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    var headingLabel = UILabel()
    var mainTextField = UITextField()
    var uibutton = UIButton()
    var sliderone = UISlider()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemPurple
        
        
//        headingLabel = UILabel(frame: CGRect(x: 100, y: 400, width: self.view.frame.size.width*70, height: self.view.frame.size.height*50))
        headingLabel = UILabel(frame: CGRect(x: 100, y: 200, width: 100, height:40))
        headingLabel.text = "Hello"
        headingLabel.textColor = .white
        view.addSubview(headingLabel)
        
        
        
        mainTextField = UITextField(frame: CGRect(x: 100, y: 300, width: 200, height: 40))
        mainTextField.placeholder = "Enter some text"
        mainTextField.backgroundColor = .cyan
        mainTextField.delegate = self
        view.addSubview(mainTextField)
        

        uibutton = UIButton(frame: CGRect(x: 130, y: 400, width: 100, height: 40))
        uibutton.setTitle("Submit", for: .normal)
        uibutton.backgroundColor = .lightText
        uibutton.addTarget(self, action: #selector(clickButton), for: .touchUpInside)
        view.addSubview(uibutton)
        
        
        sliderone = UISlider(frame: CGRect(x: 130, y: 500, width: 150, height: 10))
        sliderone.value = 1.0
        sliderone.minimumValue = 0.1
        sliderone.maximumValue = 1.0
        sliderone.thumbTintColor = .blue
        sliderone.addTarget(self, action: #selector(changedSliderValue), for: .valueChanged)
        view.addSubview(sliderone)
        
        
        
        
    }
    
    @objc func clickButton() {
        print("Hey")
        print(mainTextField.text!)
        headingLabel.text = mainTextField.text!
    }
    
    @objc func changedSliderValue() {
        print(sliderone.value)
        uibutton.layer.opacity = sliderone.value
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("Hello Text field is editing now")
    }

}

