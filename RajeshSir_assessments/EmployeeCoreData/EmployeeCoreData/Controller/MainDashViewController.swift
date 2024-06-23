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
        var nameTextField = UITextField()
        var ageTextField = UITextField()
        var idTextField = UITextField()
        
        let newEmployee = Employee(context: self.context)
        
        var model1 = EmployeeModel()
        let alert = UIAlertController(title: "New data", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { action in
            model1.storeData(nameTextField.text ?? "No data entered", Int64(idTextField.text!) ?? 0, Int64(ageTextField.text!) ?? 0)
            
            newEmployee.name = model1.getName()
            newEmployee.id = model1.getID()
            newEmployee.age = model1.getAge()
        }
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "Enter name"
            nameTextField = alertTextField
        }
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "Enter age"
            ageTextField = alertTextField
        }
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "Enter id"
            idTextField = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true)
        
        
        
        do {
            try context.save()
            print("Hello")
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
