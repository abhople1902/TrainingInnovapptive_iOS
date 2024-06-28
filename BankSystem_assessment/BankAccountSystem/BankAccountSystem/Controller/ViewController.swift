//
//  ViewController.swift
//  BankAccountSystem
//
//  Created by E5000848 on 27/06/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let basicAcc = BankAccount(accountNumber: "SF24", initialBalance: 10000)
        basicAcc.deposit(amount: 300)
        print("Now the balance of basic account is : \(basicAcc.balance)")
        basicAcc.balance = 10000000
        print("Now the balance of basic account after testing computed property is : \(basicAcc.balance)")


        let savingsAcc = SavingsAccount(accountNumber: "SF24", initialBalance: 30, interestRate: 3)
        savingsAcc.applyInterest()
        savingsAcc.withdraw(amount: 200)


        let currentAcc = CurrentAccount(overdraftLimit: 3000, accountNumber: "SF24", initialBalance: 5000)
        print("Initial balance of current account with overdraft limit is: \(currentAcc.balance)")
        currentAcc.withdraw(amount: 10000)
    }


}

