import UIKit

//MARK: - Class BankAccount
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
    
//    static func
}






//MARK: - Class SavingsAccount
class SavingsAccount: BankAccount {
    let interestRate: Double
    override var balance: Double {
        get {
            return initialBalance
        }
        set {
            print("New balance: \(newValue)")
        }
    }
    
    init(accountNumber: String, initialBalance: Double, interestRate: Double) {
        self.interestRate = interestRate
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




//MARK: - Class CurrentAccount
class CurrentAccount: BankAccount {
    let overdraftLimit: Double
    override var balance: Double {
        get {
            initialBalance + overdraftLimit
        }
        set {
            print("The new balance is \(newValue)")
            initialBalance = newValue
        }
    }
    
    init(overdraftLimit: Double, accountNumber: String, initialBalance: Double) {
        self.overdraftLimit = overdraftLimit
        super.init(accountNumber: accountNumber, initialBalance: initialBalance)
    }
    
    override func withdraw(amount: Double) {
        if (amount < (initialBalance + overdraftLimit)) {
            self.balance -= amount
        } else {
            print("Insufficient overdraft limit")
        }
    }
}





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
let newTuple = ("Ayush", 1, true)
print(newTuple.1)

