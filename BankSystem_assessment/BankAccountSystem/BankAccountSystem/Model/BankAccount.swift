//
//  BankAccount.swift
//  BankAccountSystem
//
//  Created by E5000848 on 28/06/24.
//

import Foundation

class BankAccount {
    let accountNumber: String
    var initialBalance: Double
    var balance: Double {
        get {
            return initialBalance
        }
        set {
            print("new balance: \(newValue)")
            initialBalance = newValue
        }
    }
    
    init(accountNumber: String, initialBalance: Double) {
        self.accountNumber = accountNumber
        self.initialBalance = initialBalance
    }
    
//    deinit {
//        print("Bank account closed")
//    }
    
    func deposit(amount: Double) {
        self.balance += amount
    }
    
    func withdraw(amount: Double) {
        self.balance -= amount
    }
}
