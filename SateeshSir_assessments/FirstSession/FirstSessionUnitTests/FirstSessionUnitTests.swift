//
//  FirstSessionUnitTests.swift
//  FirstSessionUnitTests
//
//  Created by E5000848 on 04/06/24.
//

import XCTest

final class First_exercise_tests: XCTestCase {
    
    func test_person_objects_should_be_equal() {
        let person1 = Person(name: "Charles", age: 28, id: "SF24")
        let person2 = Person(name: "Max", age: 28, id: "RB20")
        let person3 = Person(name: "Charles", age: 28, id: "SF24")
        
        XCTAssertTrue(person1 === person1) // Same object instance
        XCTAssertTrue(person1 == person3) // Same values, different instances (deep equality)
        XCTAssertFalse(person1 === person2) // Different instances
        XCTAssertFalse(person1 == person2) //Different values
        
    }
    
    func test_person_objects_uniqueness() {
        let name = "Carlos"
        let age = 29
        let id = "SF24"
        
        let person1 = Person(name: name, age: age, id: id)
        let person2 = Person(name: name, age: age, id: id)
        
        XCTAssertFalse(person1 === person2, "Test passed")
        
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

}


final class Second_exercise_tests: XCTestCase {
    
    func test_check_nil_objectids_have_no_nil_values() {
        let p1 = PersonStruct(name: "Checo", age: 32, id: "RB20")
        let p2 = PersonStruct(name: "Lindsay", age: 25, id: "IndyCar")
        let p3 = PersonStruct(name: "Lando", age: 27, id: "MCL60")
        
        XCTAssertFalse(p1.id == nil, "Yes, p1 is not nil")
        XCTAssertFalse(p2.id == nil, "Yes, p2 is not nil")
        XCTAssertFalse(p3.id == nil, "Yes, p3 is not nil")
    }
    
    func test_check_nil_objectids_have_nil_values() {
        let p4 = PersonStruct(name: "abc", age: 21, id: nil)
        let p5 = PersonStruct(name: "xyz", age: 22, id: nil)
        
        XCTAssertTrue(p4.id == nil, "Yes, p4 is nil")
        XCTAssertTrue(p5.id == nil, "Yes, p5 is nil")
    }
    
}


final class Third_exercise_tests: XCTestCase {
    
    func test_check_if_string_really_truncated() {
        
    }
}
