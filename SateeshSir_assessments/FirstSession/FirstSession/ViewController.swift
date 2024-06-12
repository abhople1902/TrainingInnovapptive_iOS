//
//  ViewController.swift
//  FirstSession
//
//  Created by E5000848 on 30/05/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        view.backgroundColor = .systemGray
        
        super.viewDidLoad()
        
        let button = UIButton(type: .system)
        button.setTitle("Show Numbers", for: .normal)
        button.addTarget(self, action: #selector(showActionSheet), for: .touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        button.center = view.center
        view.addSubview(button)
        
//      MARK: - (i)
        let person1 = Person(name: "Charles", age: 30, id: "SF24")
        let per5 = person1
        _ = Person(name: "Max", age: 30, id: "RB20")
        _ = Person(name: "Carlos", age: 28, id: "SF24")
        let person4 = Person(name: "Charles", age: 30, id: "SF24")
        print("Hello")
        if(person1 === person4) {
            print("Both p1 and p4 objects are equal")
        } else if(per5 === person1) {
            print("Both p1 are equal")
        }
        
        
        
//      MARK: - (ii)
        var nilIdArray = [String?]()
        var notNilIdArray = [String?]()
        
        let p1 = PersonStruct(name: "Checo", age: 32, id: "RB20")
        let p2 = PersonStruct(name: "Lindsay", age: 25, id: "IndyCar")
        let p3 = PersonStruct(name: "Lando", age: 27, id: "MCL60")
        let p4 = PersonStruct(name: "abc", age: 21, id: nil)
        let p5 = PersonStruct(name: "xyz", age: 22, id: nil)
        
        let tempArray: [PersonStruct] = [p1, p2, p3, p4, p5]
        
        tempArray.forEach { item in
            if (item.id != nil) {
                notNilIdArray.append(item.id ?? "No id in \(item) object of PersonStruct")
            } else {
                nilIdArray.append(item.id ?? "No id in \(item) object of PersonStruct")
            }
        }
        print(nilIdArray)
        print(notNilIdArray)
        
        
        
//      MARK: - (iii)
        print("1st -------------------")
        for number in 1...20 {
            if number % 2 == 0 {
                print(number)
            }
        }
        
        print("2nd -------------------")
        for number in 1..<20 {
            if number % 2 != 0 {
                print(number)
            }
        }

        print("3rd -------------------")
        func truncateStrings(_ str: String, to length: Int) -> String {
            if (length <= 0) {
                return ""
            } else if length >= str.count {
                return str
            } else {
                let endIndex = str.index(str.startIndex, offsetBy: length)
                return String(str[..<endIndex])
            }
        }
        
        let originalString = "Autodromo Jose Carlos Pace Brazil"
        let truncatedString = truncateStrings(originalString, to: 19)
        print(truncatedString)
    }
    
    
    
//  MARK: - (iv)
    @objc func showActionSheet() {
            let actionSheet = UIAlertController(title: "Choose Numbers", message: nil, preferredStyle: .actionSheet)
            
            actionSheet.addAction(UIAlertAction(title: "Prime numbers", style: .default, handler: { _ in
                self.showAlertWithNumbers(title: "Prime Numbers", numbers: self.getPrimeNumbers(upTo: 30))
            }))
            
            actionSheet.addAction(UIAlertAction(title: "Composite numbers", style: .default, handler: { _ in
                self.showAlertWithNumbers(title: "Composite Numbers", numbers: self.getCompositeNumbers(upTo: 30))
            }))
            
            actionSheet.addAction(UIAlertAction(title: "Integer numbers", style: .default, handler: { _ in
                self.showAlertWithNumbers(title: "Integer Numbers", numbers: self.getIntegerNumbers(upTo: 30))
            }))
            
            actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { action in
                let secondAlert = UIAlertController(title: "Select any option", message: "Prime, Composite, Integers", preferredStyle: .alert)
                secondAlert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(secondAlert, animated: true, completion: nil)
            }))
            present(actionSheet, animated: true, completion: nil)
        }
        
        func showAlertWithNumbers(title: String, numbers: [Int]) {
            let message = numbers.map { String($0) }.joined(separator: ", ")
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
        
        func getPrimeNumbers(upTo max: Int) -> [Int] {
            guard max >= 2 else { return [] }
            var isPrime = Array(repeating: true, count: max + 1)
            isPrime[0] = false
            isPrime[1] = false
            for i in 2...Int(sqrt(Double(max))) {
                if isPrime[i] {
                    for j in stride(from: i * i, to: max + 1, by: i) {
                        isPrime[j] = false
                    }
                }
            }
            return (2...max).filter { isPrime[$0] }
        }
        
        func getCompositeNumbers(upTo max: Int) -> [Int] {
            let primes = getPrimeNumbers(upTo: max)
            var composites = [Int]()
            for number in 2...max {
                if !primes.contains(number) {
                    composites.append(number)
                }
            }
            return composites
        }
        
        func getIntegerNumbers(upTo max: Int) -> [Int] {
            return Array(1...max)
        }


}

