//
//  ViewController.swift
//  StudentData
//
//  Created by E5000848 on 06/06/24.
//

import UIKit

class ViewController: UIViewController {

    private let button: UIButton = {
       let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 80))
        button.titleLabel?.numberOfLines = 3
        button.titleLabel?.textAlignment = .center
        button.setTitle("Log in to Student database", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        view.addSubview(button)
        button.center = view.center
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc func didTapButton() {
        let tabBarVC = UITabBarController()
        
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc1 = mainStoryBoard.instantiateViewController(withIdentifier: "DataPageViewController")
        let vc2 = mainStoryBoard.instantiateViewController(withIdentifier: "AddStudentDataViewController")
        let nav1 = UINavigationController(rootViewController: vc1)
        vc1.navigationItem.title = "Student Data"
        
        tabBarVC.setViewControllers([nav1, vc2], animated: true)
        
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = .white
        tabBarVC.tabBar.standardAppearance = appearance
        tabBarVC.tabBar.scrollEdgeAppearance = appearance
        tabBarVC.tabBar.tintColor = .blue
        tabBarVC.tabBar.unselectedItemTintColor = .black
        tabBarVC.modalPresentationStyle = .fullScreen
        if let items = tabBarVC.tabBar.items {
            items[0].image = UIImage(systemName: "house.fill")
            items[1].image = UIImage(systemName: "plus.circle.fill")
        }
//        self.navigationController?.pushViewController(vc1, animated: true)
        present(tabBarVC, animated: true)
    }
}


