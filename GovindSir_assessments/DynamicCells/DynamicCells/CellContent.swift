//
//  CellContent.swift
//  DynamicCells
//
//  Created by E5000848 on 31/05/24.
//

import Foundation
import UIKit

class CellContent: UITableViewCell {
    @IBOutlet weak var imageViewScuderia: UIImageView!
    
    @IBOutlet weak var textView: UITextView!
    
    func configureText(text: String) {
        textView.text = text
    }
    
}
