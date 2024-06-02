//
//  ClassExtensions.swift
//  assessment_4
//
//  Created by Ayush Bhople on 23/05/24.
//

import Foundation

class Circle {
    lazy var hello: String = ""
    let radius: Double
    
    init(radius: Double) {
        self.radius = radius
    }
}

extension Circle {
    
    var area: Double {
        return 3.14*radius*radius
    }
}

//let circle1 = Circle(radius: 5)
//print(circle1.area)
