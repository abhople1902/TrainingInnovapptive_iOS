//
//  PersonClass.swift
//  FirstSession
//
//  Created by E5000848 on 30/05/24.
//

import Foundation

class Person: Equatable {
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.name == rhs.name && lhs.age == rhs.age && lhs.id == rhs.id
    }
    
    let name: String
    let age: Int
    let id: String
    
    init(name: String, age: Int, id: String) {
        self.name = name
        self.age = age
        self.id = id
    }
    
    
}


