//
//  ViewController.swift
//  ViewConstraints
//
//  Created by E5000848 on 06/06/24.
//

import UIKit

class ViewController: UIViewController {

    private var myView: UIView = {
        let myView1 = UIView()
        myView1.translatesAutoresizingMaskIntoConstraints = false
        myView1.backgroundColor = .black
        return myView1
    }()
    
    private var myView2: UIView = {
        let myView2 = UIView()
        myView2.translatesAutoresizingMaskIntoConstraints = false
        myView2.backgroundColor = .systemRed
        return myView2
    }()
    
    private var myView3: UIView = {
        let myView3 = UIView()
        myView3.translatesAutoresizingMaskIntoConstraints = false
        myView3.backgroundColor = .systemYellow
        return myView3
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myView)
        view.addSubview(myView2)
        view.addSubview(myView3)
        addConstraints()
        
    }
    
    private func addConstraints() {
        var constraints = [NSLayoutConstraint]()
        
        constraints.append(myView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor))
        constraints.append(myView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor))
        constraints.append(myView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor))
        constraints.append(myView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor))
        constraints.append(myView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.3333))
        
        
        
        constraints.append(myView2.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor))
        constraints.append(myView2.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor))
        constraints.append(myView2.topAnchor.constraint(equalTo: myView.bottomAnchor))
        constraints.append(myView2.widthAnchor.constraint(equalTo: myView.widthAnchor))
        constraints.append(myView2.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3333))
        
        
        
        constraints.append(myView3.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor))
        constraints.append(myView3.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor))
        constraints.append(myView3.topAnchor.constraint(equalTo: myView2.bottomAnchor))
        constraints.append(myView3.widthAnchor.constraint(equalTo: myView2.widthAnchor))
        constraints.append(myView3.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3333))
        
        NSLayoutConstraint.activate(constraints)
    }


}

