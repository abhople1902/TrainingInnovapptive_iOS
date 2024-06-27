//
//  ParsingManagerTests.swift
//  JSONparserTests
//
//  Created by E5000848 on 27/06/24.
//

import XCTest
@testable import JSONparser

// Mock Delegate
class MockParsingManagerDelegate: ParsingManagerDelegate {
    var didCallDidParseData = false
    var parsemodel: ParseModel?
    var errorString: String?
    
    func didParseData(_ parsingManager: ParsingManager, parse: ParseModel) {
        didCallDidParseData = true
        parsemodel = parse
    }
}

final class ParsingManagerTests: XCTestCase {

    var parsingManager: ParsingManager!
    var mockDelegate: MockParsingManagerDelegate!
    
    override func setUp() {
        super.setUp()
        parsingManager = ParsingManager()
        mockDelegate = MockParsingManagerDelegate()
        parsingManager.delegate = mockDelegate
    }
    
    override func tearDown() {
        parsingManager = nil
        mockDelegate = nil
        super.tearDown()
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    func testPerformParsingWithJSONwithDifferentCases() {
        var jsonString = """
        {
            "rName": "Max",
            "tName": "Red Bull",
            "rNumber": 1
        }
"""
        parsingManager.performParsing(with: jsonString)
        
        XCTAssertNotNil(mockDelegate.parsemodel)
        XCTAssertEqual(mockDelegate.parsemodel?.racerName, "Max")
        XCTAssertEqual(mockDelegate.parsemodel?.racerNumber, 1)
        XCTAssertEqual(mockDelegate.parsemodel?.teamName, "Red Bull")
        XCTAssertEqual(mockDelegate.parsemodel?.raceWins, true)
        
        
        
        
        jsonString = """
        {
            "rName": "Carlos",
            "tName": "Ferrari",
            "rNumber": 55
        }
"""
        parsingManager.performParsing(with: jsonString)
        
        XCTAssertNotNil(mockDelegate.parsemodel)
        XCTAssertEqual(mockDelegate.parsemodel?.racerName, "Carlos")
        XCTAssertEqual(mockDelegate.parsemodel?.racerNumber, 55)
        XCTAssertEqual(mockDelegate.parsemodel?.teamName, "Ferrari")
        XCTAssertEqual(mockDelegate.parsemodel?.raceWins, true)
        
        
        
        
        
        jsonString = """
        {
            "rName": "Charles",
            "tName": "Ferrari",
            "rNumber": 16
        }
"""
        parsingManager.performParsing(with: jsonString)
        
        XCTAssertNotNil(mockDelegate.parsemodel)
        XCTAssertEqual(mockDelegate.parsemodel?.racerName, "Charles")
        XCTAssertEqual(mockDelegate.parsemodel?.racerNumber, 16)
        XCTAssertEqual(mockDelegate.parsemodel?.teamName, "Ferrari")
        XCTAssertEqual(mockDelegate.parsemodel?.raceWins, true)
        
        
        
        
        
        
        jsonString = """
        {
            "rName": "Lando",
            "tName": "McLaren",
            "rNumber": 4
        }
"""
        parsingManager.performParsing(with: jsonString)
        
        XCTAssertNotNil(mockDelegate.parsemodel)
        XCTAssertEqual(mockDelegate.parsemodel?.racerName, "Lando")
        XCTAssertEqual(mockDelegate.parsemodel?.racerNumber, 4)
        XCTAssertEqual(mockDelegate.parsemodel?.teamName, "McLaren")
        XCTAssertEqual(mockDelegate.parsemodel?.raceWins, true)
        
        
        
        
        
        jsonString = """
        {
            "rName": "Checo",
            "tName": "Red Bull",
            "rNumber": 11
        }
"""
        parsingManager.performParsing(with: jsonString)
        
        XCTAssertNotNil(mockDelegate.parsemodel)
        XCTAssertEqual(mockDelegate.parsemodel?.racerName, "Checo")
        XCTAssertEqual(mockDelegate.parsemodel?.racerNumber, 11)
        XCTAssertEqual(mockDelegate.parsemodel?.teamName, "Red Bull")
        XCTAssertEqual(mockDelegate.parsemodel?.raceWins, true)
        
        
        
        
        jsonString = """
        {
            "rName": "Carlos",
            "tName": "Ferrari",
            "rNumber": 100
        }
"""
        parsingManager.performParsing(with: jsonString)
        
        XCTAssertNotNil(mockDelegate.parsemodel)
        XCTAssertEqual(mockDelegate.parsemodel?.racerName, "Carlos")
        XCTAssertEqual(mockDelegate.parsemodel?.racerNumber, 100)
        XCTAssertEqual(mockDelegate.parsemodel?.teamName, "Ferrari")
        XCTAssertEqual(mockDelegate.parsemodel?.raceWins, false)
        
    }
    
    func testParseJSONCatchesError() {
        let malformedJsonString = """
        {
            "wrongKey1": "John Doe",
            "wrongKey2": 42,
            "wrongKey3": "Fast Team"
        }
"""
        parsingManager.performParsing(with: malformedJsonString)
        XCTAssertEqual(mockDelegate.parsemodel?.racerName, "No data")
        XCTAssertEqual(mockDelegate.parsemodel?.racerNumber, 0)
        XCTAssertEqual(mockDelegate.parsemodel?.teamName, "No data")
        XCTAssertEqual(mockDelegate.parsemodel?.raceWins, false)
        
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
