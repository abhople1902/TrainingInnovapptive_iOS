//
//  MainDashViewController.swift
//  EmployeeCoreData
//
//  Created by E5000848 on 19/06/24.
//

import UIKit
import CoreData

class MainDashViewController: UIViewController {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Students.plist")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Hello")
        print(dataFilePath ?? "NIL")
        // Do any additional setup after loading the view.
    }
    

    @IBAction func createData(_ sender: UIButton) {
        var model = EmployeeModel()
        model.storeData("Charles Leclerc", 24, 29)
        let newEmployee = Employee(context: self.context)
        newEmployee.name = model.getName()
        newEmployee.id = model.getID()
        newEmployee.age = model.getAge()
        
        do {
            try context.save()
            let alert = UIAlertController(title: "Data saved", message: "Data saved in core data", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            present(alert, animated: true)
            
        } catch {
            print("Error :- \(error)")
        }
    }
    
    @IBAction func readData(_ sender: UIButton) {
        performSegue(withIdentifier: "DataReader", sender: self)
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "DataReader") {
//            let dataReaderPage = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DataReaderViewController") as? DataReaderViewController
        }
    }

}
