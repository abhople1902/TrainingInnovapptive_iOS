//
//  CurrentAccount.swift
//  BankAccountSystem
//
//  Created by E5000848 on 28/06/24.
//

import Foundation

class CurrentAccount: BankAccount {
    let overdraftLimit: Double
    var temp: Double
    override var balance: Double {
        get {
            return temp
        }
        set {
            print("The new balance is \(newValue)")
            temp = newValue
        }
    }
    
    init(overdraftLimit: Double, accountNumber: String, initialBalance: Double) {
        self.overdraftLimit = overdraftLimit
        self.temp = overdraftLimit + initialBalance
        super.init(accountNumber: accountNumber, initialBalance: initialBalance)
    }
    
    override func withdraw(amount: Double) {
        if (amount < (initialBalance + overdraftLimit)) {
            self.balance = self.balance - amount
        } else {
            print("Insufficient overdraft limit")
        }
    }
}
