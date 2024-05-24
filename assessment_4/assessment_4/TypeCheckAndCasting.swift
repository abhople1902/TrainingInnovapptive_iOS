//
//  TypeCheckAndCasting.swift
//  assessment_4
//
//  Created by Ayush Bhople on 23/05/24.
//

import Foundation

class Vehicle {
    
}

class Car: Vehicle {
    
}

class Bike: Vehicle {
    
}

func describeVehicles(vehicles : [Vehicle]) {
    vehicles.forEach { vehicle in
        print("--------------------------------")
        print("Before casting")
        if (vehicle is Car) {
            print("This is a car")
            print(type(of: vehicle))
        }
        print("After casting")
        let temp = vehicle as? Bike
        if (temp != nil) {
            print("Now it is a bike")
        } else {
            print("Could not convert")
        }
    }
}

//let anObj: Vehicle = Car()
//describeVehicles(vehicles: [Car(), Bike(), anObj, Car()])
