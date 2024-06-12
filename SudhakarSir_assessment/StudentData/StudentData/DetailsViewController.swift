//
//  DetailsViewController.swift
//  StudentData
//
//  Created by E5000848 on 07/06/24.
//

import UIKit
import Foundation

class DetailsViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dobLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var studentImage: UIImageView!
    @IBOutlet weak var ageLabel: UILabel!
    
    
    var tempArr = DataModel(name: "Hello", gender: "", img: #imageLiteral(resourceName: "plus"), dob: Date(), id: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = tempArr.name
        dobLabel.text = formatDate(tempArr.dob)
        ageLabel.text = tempArr.gender
        idLabel.text = tempArr.id
        studentImage.image = tempArr.img
    }
    
    
    func formatDate(_ date: Date) -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .none
            return dateFormatter.string(from: date)
        }

}
