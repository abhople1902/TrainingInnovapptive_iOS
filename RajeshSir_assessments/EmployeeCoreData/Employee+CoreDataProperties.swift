//
//  Employee+CoreDataProperties.swift
//  EmployeeCoreData
//
//  Created by E5000848 on 20/06/24.
//
//

import Foundation
import CoreData


extension Employee {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Employee> {
        return NSFetchRequest<Employee>(entityName: "Employee")
    }

    @NSManaged public var age: Int64
    @NSManaged public var id: Int64
    @NSManaged public var name: String?

}

extension Employee : Identifiable {

}
