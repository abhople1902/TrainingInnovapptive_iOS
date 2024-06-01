//
//  ViewController.swift
//  DynamicCells
//
//  Created by E5000848 on 31/05/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let mainArr:[[UIColor]] = [[.red, .orange],[.yellow, .brown],[.black]]
    
    let carText = "SF90 Stradale XX"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        tableView.register(CellContent.self, forCellReuseIdentifier: "CellContent")
        tableView.register(UINib(nibName: "CellContent", bundle: nil), forCellReuseIdentifier: "cellContent")
        
        tableView.delegate = self
        tableView.dataSource = self
    }

}


extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return mainArr[section].count
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellContent", for: indexPath)
        
//        let cellContent = CellContent()
//        
//        cell.addSubview(cellContent)
        
        
        
        return cell
    }
}

