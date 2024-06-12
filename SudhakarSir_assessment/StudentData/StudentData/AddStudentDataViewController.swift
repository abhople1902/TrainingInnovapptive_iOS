//
//  AddStudentDataViewController.swift
//  StudentData
//
//  Created by E5000848 on 06/06/24.
//

import Foundation
import UIKit

class AddStudentDataViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    
    
    let nameTextField = UITextField(frame: CGRect(x: 148, y: 350, width: 213, height: 34))
    let genderTextField = UITextField(frame: CGRect(x: 148, y: 549, width: 180, height: 21))
    let idTextField = UITextField(frame: CGRect(x: 148, y: 641, width: 213, height: 34))
    
    
    private let addImage: UIButton = {
        let addImage = UIButton(frame: CGRect(x: 100, y: 150, width: 180, height: 180))
        addImage.titleLabel?.numberOfLines = 1
        addImage.titleLabel?.textAlignment = .center
        addImage.setTitle("Change Image", for: .normal)
        addImage.setImage(.add, for: .normal)
//        let sfimage = UIImage(systemName: "plus.circle.fill")
//        addImage.imageView?.image = sfimage
        addImage.backgroundColor = .clear
        addImage.layer.zPosition = 1
        return addImage
    }()
    
    
    private let imageSelected: UIImageView = {
        let imageSelected = UIImageView(frame: CGRect(x: 100, y: 150, width: 180, height: 180))
        imageSelected.image = #imageLiteral(resourceName: "UserIcon")
        imageSelected.layer.cornerRadius = imageSelected.frame.height/2
        imageSelected.clipsToBounds = true
        imageSelected.contentMode = .scaleAspectFill
        imageSelected.layer.masksToBounds = true
        return imageSelected
    }()
    
    
//    var studentDataArray: [CellContent] = []
    var dataModel = DataModel(name: String(), gender: String(), img: UIImage(), dob: Date(), id: String())
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(addImage)
        addImage.addTarget(self, action: #selector(addImageButtonTapped(_:)), for: .touchUpInside)
        view.addSubview(imageSelected)
        
        setUpNameTextField()
        setUpDOBdatePicker()
        setUpGenderTextField()
        setUpIDtextField()
        
        setUpNameLabel()
        setUpDOBlabel()
        setUpGenderLabel()
        setUpIdLabel()
        
        setUpSubmit()
        
    }
    
    @objc func addImageButtonTapped(_ sender: UIButton) {
        let myImagePickerViewController = UIImagePickerController()
        myImagePickerViewController.delegate = self
        myImagePickerViewController.sourceType = UIImagePickerController.SourceType.photoLibrary
        
        self.present(myImagePickerViewController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageSelected.image = pickedImage
            imageSelected.backgroundColor = UIColor.clear
            imageSelected.contentMode = UIView.ContentMode.scaleAspectFit
            
            dataModel.img = pickedImage
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func setUpNameTextField() {
//        let nameTextField = UITextField(frame: CGRect(x: 148, y: 350, width: 213, height: 34))
        nameTextField.placeholder = "Name of student"
        nameTextField.textAlignment = .left
        nameTextField.clearButtonMode = .whileEditing
        view.addSubview(nameTextField)
//        dataModel.name = nameTextField.text ?? "No data entered"
    }
    
    
    func setUpDOBdatePicker() {
        let datePicker = UIDatePicker(frame: CGRect(x: 148, y: 445, width: 183, height: 43))
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(datePickerChanged(_:)), for: .valueChanged)
        view.addSubview(datePicker)
    }
    
    @objc func datePickerChanged(_ sender: UIDatePicker) {
        dataModel.dob = sender.date
    }
    
    func setUpGenderTextField(){
//        let genderLabel = UITextField(frame: CGRect(x: 148, y: 549, width: 180, height: 21))
        genderTextField.placeholder = "Gender of student"
        genderTextField.textAlignment = .left
        view.addSubview(genderTextField)
//        dataModel.gender = genderLabel.text ?? "Not defined"
    }
    
    
    func setUpIDtextField() {
        idTextField.placeholder = "ID of student"
        idTextField.textAlignment = .left
        view.addSubview(idTextField)
        
    }
    
    
    func setUpNameLabel() {
        let nameLabel = UILabel(frame: CGRect(x: 48, y: 357, width: 54, height: 21))
        nameLabel.text = "Name :"
        view.addSubview(nameLabel)
    }
    
    func setUpDOBlabel() {
        let dobLabel = UILabel(frame: CGRect(x: 48, y: 456, width: 45, height: 21))
        dobLabel.text = "DOB :"
        view.addSubview(dobLabel)
    }
    
    
    func setUpGenderLabel() {
        let genderLabel = UILabel(frame: CGRect(x: 48, y: 549, width: 40, height: 21))
        genderLabel.text = "Gender :"
        view.addSubview(genderLabel)
    }
    
    
    func setUpIdLabel() {
        let idLabel = UILabel(frame: CGRect(x: 48, y: 648, width: 26, height: 21))
        idLabel.text = "ID :"
        view.addSubview(idLabel)
    }
    
    
    func setUpSubmit() {
        let submit = UIButton(frame: CGRect(x: 158, y: 685, width: 78, height: 35))
        submit.setTitle("Submit", for: .normal)
        submit.setTitleColor(.white, for: .normal)
        submit.backgroundColor = .systemBlue
        submit.addTarget(self, action: #selector(submitData), for: .touchUpInside)
        view.addSubview(submit)
    }
    
    
    @objc func submitData() {
        var dataModel2 = TableDataSource()
        
        dataModel.name = nameTextField.text ?? "No data entered"
        dataModel.gender = genderTextField.text ?? "Not defined"
        dataModel.id = idTextField.text ?? "No id received"
        
        TableDataSource.mainArr = dataModel2.addData(dataModel.name, dataModel.gender, image: dataModel.img, date: dataModel.dob, ID: dataModel.id)
        print(TableDataSource.mainArr)
    }
    
    
}
