//
//  AnyObject.swift
//  assessment_4
//
//  Created by Ayush Bhople on 23/05/24.
//

import Foundation

class SampleArrayOfAnyType {
    let arr1: [Any]
    
    init(arr1: [Any]) {
        self.arr1 = arr1
    }
    
    func describeElements(elements: [Any]) {
        elements.forEach { ele in
            var tp = type(of: ele)
            if ele is Int {
                print("The type of this element is Int: \(tp)")
            } else if ele is String {
                print("The type of this element is String: \(tp)")
            } else {
                print("The type is an object: \(tp)")
            }
        }
    }
}

class Dummy {
    func simpleDummy() {
        print("Hello")
    }
}

//let dummyInstance = Dummy()
//
//let sampleArray = SampleArrayOfAnyType(arr1: [95014, "Cupertino", dummyInstance])
//
//sampleArray.describeElements(elements: sampleArray.arr1)


