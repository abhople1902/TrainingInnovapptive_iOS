//
//  CurrentAccountTests.swift
//  BankAccountSystemTests
//
//  Created by E5000848 on 28/06/24.
//

import XCTest
@testable import BankAccountSystem

final class CurrentAccountTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    //MARK: - Balance get and set
    func testInitialBalanceAndOverdraftLimit() {
        let accountNumber = "95014"
        let initialBalance = 500.00
        let overdraftLimit = 50.00
        
        let currentAcc = CurrentAccount(overdraftLimit: overdraftLimit, accountNumber: accountNumber, initialBalance: initialBalance)
        
        let balance = currentAcc.balance
        
        XCTAssertEqual(balance, initialBalance + overdraftLimit, "Initial balance should be equal to initialBalance + overdraftLimit")
    }
    
    //MARK: - Deposit function check
    func testDeposit() {
        let accountNumber = "123"
        let initialBalance = 100.0
        let overdraftLimit = 50.0
        let currentAccount = CurrentAccount(overdraftLimit: overdraftLimit, accountNumber: accountNumber, initialBalance: initialBalance)

        // When
        var balance = currentAccount.balance
        print(balance)
        currentAccount.deposit(amount: 50.0)
        balance = currentAccount.balance

        // Then
        XCTAssertEqual(balance, initialBalance + overdraftLimit + 50.0, "Balance should be increased by the deposited amount")
    }
    
    //MARK: - Withdrawing within limit
    func testWithdrawWithinLimit() {
        // Given
        let accountNumber = "12345"
        let initialBalance = 100.0
        let overdraftLimit = 50.0
        let currentAccount = CurrentAccount(overdraftLimit: overdraftLimit, accountNumber: accountNumber, initialBalance: initialBalance)

        // When
        var balance = currentAccount.balance
        print(balance)
        currentAccount.withdraw(amount: 50.0)
        balance = currentAccount.balance

        // Then
        XCTAssertEqual(balance, initialBalance + overdraftLimit - 50.0, "Balance should be decreased by the withdrawn amount within the limit")
    }
    
    //MARK: - Withdrawing outside limit
    func testWithdrawExceedingLimit() {
        // Given
        let accountNumber = "123456789"
        let initialBalance = 100.0
        let overdraftLimit = 50.0
        let currentAccount = CurrentAccount(overdraftLimit: overdraftLimit, accountNumber: accountNumber, initialBalance: initialBalance)

        // When
        currentAccount.withdraw(amount: 200.0)
        let balance = currentAccount.balance

        // Then
        XCTAssertEqual(balance, initialBalance + overdraftLimit, "Balance should not change if withdrawal amount exceeds the limit")
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
