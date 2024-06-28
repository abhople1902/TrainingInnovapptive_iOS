//
//  Second_sessionTests.swift
//  Second_sessionTests
//
//  Created by E5000848 on 27/06/24.
//

import XCTest
@testable import Second_session

class MockDataDelegate: DataDelegate {
    var stringToSend: String?
    var didSendData: Bool = false
    
    func sendData(_ data: String?) {
        didSendData = true
        stringToSend = data
    }
}

final class Second_sessionTests: XCTestCase {

    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
