//
//  DataReaderViewController.swift
//  EmployeeCoreData
//
//  Created by E5000848 on 19/06/24.
//

import UIKit
import CoreData

class DataReaderViewController: UIViewController {

    @IBOutlet weak var employeeTableView: UITableView!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var employeeDataArray: [Data] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        employeeTableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        prepareData()
        employeeTableView.reloadData()
    }
    
    
    
    func setUpUI() {
        employeeTableView.dataSource = self
        employeeTableView.delegate = self
    }
    
    func prepareData() {
        let request: NSFetchRequest<Employee> = Employee.fetchRequest()
        do {
            let employees = try context.fetch(request)
            for emp in employees{
                let x = Data(name: emp.name ?? "No name", age: emp.age, id: emp.id)
                employeeDataArray.append(x)
            }
        } catch {
            print("Error: - \(error)")
        }
    }
}


//MARK: - Table view Datasource methods
extension DataReaderViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employeeDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = employeeTableView.dequeueReusableCell(withIdentifier: primaryCellEmp.cellIdentifier) as! primaryCellEmp
        cell.setData(data: employeeDataArray[indexPath.row])
        return cell
    }
}


//MARK: - Table view Delegate methods
extension DataReaderViewController: UITableViewDelegate {
    
    func saveItems() {
        do {
            try context.save()
            employeeDataArray.removeAll()
            prepareData()
            employeeTableView.reloadData()
        } catch {
            print("Error saving context: \(error)")
        }
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        let deleteAction = UIContextualAction(style: .destructive, title: "Delete", handler: {_,_,_ in 
//            
//        })
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, view, handler) in
            self.handleDeletion(at: indexPath)
            handler(true)
        }
        deleteAction.backgroundColor = .red
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let updateAction = UIContextualAction(style: .normal, title: "Update") { (action, view, handler) in
            self.handleUpdation(at: indexPath)
            handler(true)
        }
        updateAction.backgroundColor = .blue
        return UISwipeActionsConfiguration(actions: [updateAction])
    }
    
    func handleDeletion(at indexPath: IndexPath) {
        
        let employee = employeeDataArray[indexPath.row]
        let idOfEmployeeToBeDeleted = employee.id
        
        let fetchRequest: NSFetchRequest<Employee> = Employee.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id = %d", idOfEmployeeToBeDeleted)
        
        do {
            guard let test = try context.fetch(fetchRequest) as? [Employee], let objectDelete = test.first else {
                return
            }
            context.delete(objectDelete)
            self.saveItems()
//            print("Deleted item at \(indexPath)")
//            employeeTableView.deleteRows(at: [indexPath], with: .automatic)
        } catch {
            print(error)
        }
    }
    
    func handleUpdation(at indexPath: IndexPath) {
        var nameTextField = UITextField()
        var ageTextField = UITextField()
        var idTextField = UITextField()
        
        let employee = employeeDataArray[indexPath.row]
        let idOfEmployeeToBeChanged = employee.id
        
        let fetchRequest: NSFetchRequest<Employee> = Employee.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id = %d", idOfEmployeeToBeChanged)
        
        do {
            guard let test = try context.fetch(fetchRequest) as? [Employee], let objectUpdate = test.first else {
                return
            }
            
            var model1 = EmployeeModel()
            let alert = UIAlertController(title: "New data", message: "", preferredStyle: .alert)
            let action = UIAlertAction(title: "Add Item", style: .default) { action in
                
                model1.storeData(nameTextField.text ?? "No data entered", Int64(idTextField.text!) ?? 0, Int64(ageTextField.text!) ?? 0)
                
                
                objectUpdate.setValue(model1.getName(), forKey: "name")
                objectUpdate.setValue(model1.getAge(), forKey: "age")
                objectUpdate.setValue(model1.getID(), forKey: "id")
                self.saveItems()
            }
            alert.addTextField { alertTextField in
                alertTextField.placeholder = "Enter new name"
                nameTextField = alertTextField
            }
            alert.addTextField { alertTextField in
                alertTextField.placeholder = "Enter new age"
                ageTextField = alertTextField
            }
            alert.addTextField { alertTextField in
                alertTextField.placeholder = "Enter new id"
                idTextField = alertTextField
            }
            alert.addAction(action)
            present(alert, animated: true)
            
            
            print("Updated item at \(indexPath)")
            print("Name: \(objectUpdate.name ?? "No data")")
            print("Age: \(objectUpdate.age)")
            print("ID: \(objectUpdate.id)")
        } catch {
            print(error)
        }
    }
}
