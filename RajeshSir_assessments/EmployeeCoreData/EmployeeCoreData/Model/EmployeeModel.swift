//
//  EmployeeModel.swift
//  EmployeeCoreData
//
//  Created by E5000848 on 19/06/24.
//

import Foundation

struct EmployeeModel {
    var employeeData: Data?
    
    mutating func storeData(_ name: String, _ id: Int64, _ age: Int64) {
        employeeData = Data(name: name, age: age, id: id)
    }
    
    func getName() -> String {
        return employeeData?.name ?? "No name"
    }
    
    func getID() -> Int64 {
        return employeeData?.id ?? 0
    }
    
    func getAge() -> Int64 {
        return employeeData?.age ?? 0
    }
        
}

struct Data {
    let name: String
    var age: Int64
    let id: Int64
}
