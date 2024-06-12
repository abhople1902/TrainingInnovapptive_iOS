//
//  ViewController.swift
//  SecondSession
//
//  Created by E5000848 on 03/06/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var fileTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }


//    func getFolderPath() ->  URL{
//        let directoryURL = FileManager.default.urls(for: .desktopDirectory, in: .userDomainMask)[0]
//        print(directoryURL)
//        return directoryURL
//    }
    
    func getFileURL(filename: String) -> URL? {
//        let filePath = URL(fileURLWithPath: filename, relativeTo: url).appendingPathExtension("txt")
        let filePath2 = Bundle.main.url(forResource: filename, withExtension: "txt")
        print(type(of:filePath2))
        return filePath2
    }
    
    
    @IBAction func writeDataPressed(_ sender: UIButton) {
//        let folderPath = getFolderPath()
        
        guard let filePath = getFileURL(filename: fileTextField.text ?? "no data entered") else {
            let fileNotExistAlert = UIAlertController(title: "File does not exist", message: "Enter correct file path", preferredStyle: .alert)
            fileNotExistAlert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(fileNotExistAlert, animated: true)
            return
        }
        
        let text = try? String(contentsOf: filePath)
//        try data.write(to: filePath.absoluteURL)
//        print("Data written to:\(filePath.absoluteURL)")
        print(text ?? "Nothing in the file")
    }
    
    
}
