//
//  SavingAccountTests.swift
//  BankAccountSystemTests
//
//  Created by E5000848 on 28/06/24.
//

import XCTest
@testable import BankAccountSystem

final class SavingAccountTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    
    func testInitialBalance() {
            // Given
            let accountNumber = "95014"
            let initialBalance = 1000.0
            let interestRate = 5.0
            let savingsAccount = SavingsAccount(accountNumber: accountNumber, initialBalance: initialBalance, interestRate: interestRate)

            // When
            let balance = savingsAccount.balance

            // Then
            XCTAssertEqual(balance, initialBalance, "Initial balance should be equal to the given initialBalance")
        }

        func testDeposit() {
            // Given
            let accountNumber = "95014"
            let initialBalance = 1000.0
            let interestRate = 5.0
            let savingsAccount = SavingsAccount(accountNumber: accountNumber, initialBalance: initialBalance, interestRate: interestRate)

            // When
            savingsAccount.deposit(amount: 500.0)
            let balance = savingsAccount.balance

            // Then
            XCTAssertEqual(balance, initialBalance + 500.0, "Balance should be increased by the deposited amount")
        }

        func testWithdrawWithinLimit() {
            // Given
            let accountNumber = "95014"
            let initialBalance = 1000.0
            let interestRate = 5.0
            let savingsAccount = SavingsAccount(accountNumber: accountNumber, initialBalance: initialBalance, interestRate: interestRate)

            // When
            savingsAccount.withdraw(amount: 500.0)
            let balance = savingsAccount.balance

            // Then
            XCTAssertEqual(balance, initialBalance - 500.0, "Balance should be decreased by the withdrawn amount within the limit")
        }

        func testWithdrawBelowMinimumBalance() {
            // Given
            let accountNumber = "95014"
            let initialBalance = 50.0
            let interestRate = 5.0
            let savingsAccount = SavingsAccount(accountNumber: accountNumber, initialBalance: initialBalance, interestRate: interestRate)

            // When
            savingsAccount.withdraw(amount: 30.0)
            let balance = savingsAccount.balance

            // Then
            XCTAssertEqual(balance, initialBalance, "Balance should not change if withdrawal would result in balance below the minimum required balance")
        }

        func testApplyInterest() {
            // Given
            let accountNumber = "95014"
            let initialBalance = 1000.0
            let interestRate = 5.0
            let savingsAccount = SavingsAccount(accountNumber: accountNumber, initialBalance: initialBalance, interestRate: interestRate)

            // When
            savingsAccount.applyInterest()
            let balance = savingsAccount.balance

            // Then
            let expectedBalance = initialBalance + (initialBalance * interestRate / 100)
            XCTAssertEqual(balance, expectedBalance, "Balance should include the applied interest")
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
