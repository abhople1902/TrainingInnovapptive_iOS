//
//  File.swift
//  EmployeeCoreData
//
//  Created by E5000848 on 19/06/24.
//

import Foundation
import UIKit

class primaryCellEmp: UITableViewCell {
    static let cellIdentifier = "primaryCellEmp"
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
        ageLabel.text = nil
        idLabel.text = nil
    }
    
    func setData(data: Data) {
        nameLabel.text = data.name
        ageLabel.text = String(data.age)
        idLabel.text = String(data.id)
    }
    
}
