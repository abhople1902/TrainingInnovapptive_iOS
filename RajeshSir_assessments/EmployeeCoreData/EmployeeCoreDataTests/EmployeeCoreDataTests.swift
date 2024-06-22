//
//  EmployeeCoreDataTests.swift
//  EmployeeCoreDataTests
//
//  Created by E5000848 on 19/06/24.
//

import XCTest
import CoreData
@testable import EmployeeCoreData

final class EmployeeCoreDataTests: XCTestCase {

    let myContext = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_updateEntry() throws {
        
        let fetchRequest: NSFetchRequest<Employee> = Employee.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "name = %@", "Lewis")
        
        let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Employees.plist")
        print(dataFilePath ?? "NIL")
        
        do {
            guard let test = try myContext?.fetch(fetchRequest), let objectUpdate = test.first else {
                XCTFail("Employee not found")
                return
            }
            objectUpdate.setValue("Lewis Hamilton", forKey: "name")
            
            do {
                try myContext?.save()
            } catch {
                XCTFail("Failed to save context \(error)")
            }
            
            
            var model = EmployeeModel()
            model.storeData("Lewis Hamilton", 24, 29)
            XCTAssertEqual(objectUpdate.name, model.getName())
            XCTAssertEqual(objectUpdate.id, model.getID())
            XCTAssertEqual(objectUpdate.age, model.getAge())
            print(objectUpdate.name!)
            print(objectUpdate.id)
            print(objectUpdate.age)
        } catch {
            print(error)
        }
        
    }
    
    func test_deleteEntry() throws {
        
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
