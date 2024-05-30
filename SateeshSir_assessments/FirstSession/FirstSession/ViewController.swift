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
        
//      MARK: - (i)
        let person1 = Person(name: "Charles", age: 30, id: "SF24")
        _ = Person(name: "Max", age: 30, id: "RB20")
        _ = Person(name: "Carlos", age: 28, id: "SF24")
        let person4 = Person(name: "Charles", age: 30, id: "SF24")
        print("Hello")
        if(person1 === person4) {
            print("Both p1 and p4 objects are equal")
        } else if(person1 === person1) {
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
        
        var tempArray: [PersonStruct] = [p1, p2, p3, p4, p5]
        
        tempArray.forEach { item in
            if (item.id != nil){
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


}

