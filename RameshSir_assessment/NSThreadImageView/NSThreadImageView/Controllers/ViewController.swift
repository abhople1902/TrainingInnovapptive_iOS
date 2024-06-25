//
//  ViewController.swift
//  NSThreadImageView
//
//  Created by E5000848 on 25/06/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var linkTextField: UITextField!
    var linkText = String()
    var isUpdatingOnMainThread: Bool = true
    
    
    @IBOutlet weak var imageFetchedView: UIImageView!
    var apimanager = APIManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        apimanager.delegate = self
        
        startUIUpdates()
    }
    
    @IBAction func fetchImagePressed(_ sender: UIButton) {
        linkText = linkTextField.text!
        let myThread = Thread(target: self, selector: #selector(fetchImage), object: nil)
        myThread.start()
    }
    
    @objc func fetchImage() {
//        guard let imageURL = URL(string: "https://images.unsplash.com/photo-1597687210367-a4915552d886?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8ZmVycmFyaXxlbnwwfHwwfHx8MA%3D%3D") else {
//            print("Invalid URL")
//            return
//        }
//        
//        do {
//            let imageData = try Data(contentsOf: imageURL)
//            if let img = UIImage(data: imageData) {
//                DispatchQueue.main.async {
//                    self.imageFetchedView.image = img
//                }
//            }
//        } catch {
//            print("Failed to update image from data from URL")
//            print(error)
//        }
        apimanager.fetchData(withURL: linkText)
    }
    
    func startUIUpdates() {
        var speed = 0
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in
            if self.isUpdatingOnMainThread {
                speed += 10
                self.speedLabel.text = "\(speed) kmph"
                if speed >= 100 {
                    speed = 0
                }
            } else {
                timer.invalidate()
            }
        }
    }
    @IBAction func stopSpeedTimerPressed(_ sender: UIButton) {
        self.isUpdatingOnMainThread = false
    }
}

extension ViewController: APIManagerDelegate {
    func didFetchDataFromAPI(_ manager: APIManager, image: UIImage) {
        imageFetchedView.image = image
    }
    
    func didFailWithError(error: any Error) {
        print("DidFailWithError")
        return
    }
    
    
}

