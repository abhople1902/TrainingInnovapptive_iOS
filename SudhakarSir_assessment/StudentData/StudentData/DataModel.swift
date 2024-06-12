//
//  DataModel.swift
//  StudentData
//
//  Created by E5000848 on 06/06/24.
//

import Foundation
import UIKit

protocol CellContent {
    var name: String { get set }
    var gender: String { get set }
    var img: UIImage { get set }
    var dob: Date { get set }
    var id: String { get set }
}

struct DataModel: CellContent {
    var name: String
    var gender: String
    var img: UIImage
    var dob: Date
    var id: String
}

struct TableDataSource {
    static var mainArr: [CellContent] = []
    
    static func getData() -> [CellContent] {
        return mainArr
    }
    
    mutating func addData(_ name: String, _ gender: String, image: UIImage, date: Date, ID: String) -> [CellContent]{
        let tempObject = DataModel(name: name, gender: gender, img: image, dob: date, id: ID)
        TableDataSource.mainArr.append(tempObject)
        return TableDataSource.mainArr
    }
}
