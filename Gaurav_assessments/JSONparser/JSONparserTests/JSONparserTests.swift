//
//  JSONparserTests.swift
//  JSONparserTests
//
//  Created by E5000848 on 31/05/24.
//

import XCTest
@testable import JSONparser

class ParsingManagerDelegateMock: ParsingManagerDelegate {
    var didCallDidParsePerform = false
    var parsemodel: ParseModel?
    var errorString: String?
    
    func didParseData(_ parsingManager: ParsingManager, parse: ParseModel) {
        didCallDidParsePerform = true
        parsemodel = parse
    }
}

final class JSONparserTests: XCTestCase {
    
    var vc : ViewController!
    
    var parsingManager: ParsingManager!
    var mockDelegate: ParsingManagerDelegateMock!
    
    override func setUp() {
        super.setUp()
       // parsingManager = ParsingManager()
        mockDelegate = ParsingManagerDelegateMock()
        vc = ViewController()
        vc.parsingManager.delegate = mockDelegate
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testParserFunctionCalled() {
        let jsonString = """
        {
            "rName": "Max",
            "tName": "Red Bull",
            "rNumber": 1
        }
"""
        
        vc.parser(jsonString)
//        vc.didParseData(parsingManager, parse: mockDelegate.parsemodel!)

        XCTAssertEqual(mockDelegate.parsemodel?.racerName, "Max")
        XCTAssertEqual(mockDelegate.parsemodel?.racerNumber, 1)
        XCTAssertEqual(mockDelegate.parsemodel?.teamName, "Red Bull")
        XCTAssertEqual(mockDelegate.parsemodel?.raceWins, true)
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
