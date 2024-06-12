//
//  PrimaryStudentCell.swift
//  StudentData
//
//  Created by E5000848 on 06/06/24.
//

import Foundation
import UIKit

class PrimaryStudentCell: UITableViewCell {
    static let cellIdentifier = "StudentCell"
    
    @IBOutlet weak var studentName: UILabel!
    @IBOutlet weak var imageContent: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        studentName.text = nil
        imageContent.image = nil
    }
    
    func setData(cellContent: CellContent) {

        studentName.text = cellContent.name
        imageContent.image = cellContent.img
    }
}
