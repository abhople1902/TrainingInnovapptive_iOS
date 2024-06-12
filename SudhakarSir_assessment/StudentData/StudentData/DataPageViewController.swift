//
//  DataPageViewController.swift
//  StudentData
//
//  Created by E5000848 on 06/06/24.
//

import Foundation
import UIKit

class DataPageViewController: UIViewController {
    
    
    @IBOutlet weak var studentTableView: UITableView!
    
    var studentDataArray: [CellContent] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        prepareData()
        setUpUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        prepareData()
    }
    
    func prepareData() {
        studentDataArray = TableDataSource.getData()
        print("Student data array at time of view loading and appearing:\(studentDataArray)")
        studentTableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    func setUpUI() {
        studentTableView.dataSource = self
        studentTableView.delegate = self
    }
    
    
        
//        let dataObject = TableDataSource(mainArr: studentDataArray)
}


// MARK: - TableView datasource methods
extension DataPageViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let model = studentDataArray[indexPath.row]
        print("model in data page: \(model)")
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PrimaryStudentCell.cellIdentifier, for: indexPath) as? PrimaryStudentCell else { return UITableViewCell(frame: .zero) }
        
        cell.setData(cellContent: model as! DataModel)
        return cell
    }
    
}


// MARK: - TableView delegate methods
extension DataPageViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController
        detailsVC?.tempArr = studentDataArray[indexPath.row] as! DataModel
        self.present(detailsVC ?? UIViewController(), animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}

