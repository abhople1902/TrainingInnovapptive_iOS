//
//  SavingsAccount.swift
//  BankAccountSystem
//
//  Created by E5000848 on 28/06/24.
//

import Foundation

class SavingsAccount: BankAccount {
    let interestRate: Double
    var temp: Double
    override var balance: Double {
        get {
            return temp
        }
        set {
            print("New balance: \(newValue)")
            temp = newValue
        }
    }
    
    init(accountNumber: String, initialBalance: Double, interestRate: Double) {
        self.interestRate = interestRate
        self.temp = initialBalance
        super.init(accountNumber: accountNumber, initialBalance: initialBalance)
    }
    
    deinit {
        print("Savings account closed")
    }
    
    func applyInterest() {
        let interest = ((initialBalance) * (interestRate/100))
        initialBalance += interest
        self.balance = initialBalance
        print("Interest applied and new balance is \(balance)")
    }
    
    override func withdraw(amount: Double) {
        if(balance < 100){
            print("Insufficient balance")
        } else {
            self.balance -= amount
            print("Now the balance after withdrawing from savings account is: \(self.balance)")
        }
    }
}
