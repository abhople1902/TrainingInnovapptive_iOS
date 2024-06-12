//
//  Delegates.swift
//  assessment_4
//
//  Created by Ayush Bhople on 23/05/24.
//

import Foundation

protocol TaskDelegate {
    func taskDidComplete()
}


//delegator
class Task {
    var delegate: TaskDelegate
    
    init(delegate: TaskDelegate) {
        self.delegate = delegate
    }
    
    
}

//delegate
class TaskHandler: TaskDelegate {
    private var taskLogger: Int = 0 {
        didSet {
            print("Value of task logger is \(taskLogger)")
        }
    }
    
    func taskDidComplete() {
        self.taskLogger += 1
    }
}

let taskHandler = TaskHandler()
let task = Task(delegate: taskHandler)

task.delegate.taskDidComplete()
