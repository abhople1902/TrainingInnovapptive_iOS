//
//  DataModel.swift
//  DynamicCells
//
//  Created by E5000848 on 05/06/24.
//

import Foundation
import UIKit

enum CellType {
    case text
    case image
}

protocol DataModel {
    var type: CellType { get set }
}

struct TextModel:DataModel {
    var type: CellType
    var text: String
}

struct ImageModel:DataModel {
    var type: CellType
    var image: UIImage
}


struct TableDataSource {
    static func prepareData() -> [DataModel] {
        
        let textType1 = TextModel(type: .text, text: "Hello and Good morning")
        let textType2 = TextModel(type: .text, text: "Welcome to WWDC")
        let textType3 = TextModel(type: .text, text: "Introducing AI")
        
        let imageType1 = ImageModel(type: .image, image: UIImage(named: "image1")!)
        let imageType2 = ImageModel(type: .image, image: UIImage(named: "image2")!)
        let imageType3 = ImageModel(type: .image, image: UIImage(named: "image3")!)
        
        return [textType1, textType2, textType3, imageType1, imageType2, imageType3]
        
    }
}
