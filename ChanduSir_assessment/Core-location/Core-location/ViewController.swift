//
//  ViewController.swift
//  Core-location
//
//  Created by E5000848 on 24/06/24.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    var locationManager: CLLocationManager?
    @IBOutlet weak var addressTextField: UITextField!
    
    @IBOutlet weak var coordinatesTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        
        locationManager?.requestWhenInUseAuthorization()
    }
    
    @IBAction func getLocationTapped(_ sender: UIButton) {
        locationManager?.requestLocation()
    }
    
    
    @IBAction func getCoordinates(_ sender: UIButton) {
        forwardGeocoding(addressTextField.text ?? "Nagpur")
    }
    
    
    @IBAction func getAddress(_ sender: UIButton) {
        let myarr = coordinatesTextField.text!.split(separator: ",")
        print(myarr)
        reverseGeocoding(Double(myarr[0])!, Double(myarr[1])!)
    }
    
    func forwardGeocoding(_ address: String) {
        let geocoder = CLGeocoder()
        
        geocoder.geocodeAddressString(address) { (placemarks, error) in
            if error != nil {
                print("Failed to retrieve location")
                print(error as Any)
                return
            }
            
            var loc: CLLocation?
            
            if let placemarks = placemarks, placemarks.count > 0 {
                loc = placemarks.first?.location
            }
            
            if let location = loc {
                let coordinate = location.coordinate
                print("lat: \(coordinate.latitude), lon: \(coordinate.longitude)")
            } else {
                print("No matching location")
            }
        }
    }
    
    func reverseGeocoding(_ lat: CLLocationDegrees, _ lon: CLLocationDegrees) {
        let geocoder = CLGeocoder()
        let location = CLLocation(latitude: lat, longitude: lon)
        geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
            if error != nil {
                print("Failed to retrieve coordinates")
                return
            }
            
            var message: [String] = []
    
            
            if let placemarks = placemarks, let placemark = placemarks.first {
                print("Street address: \(placemark.thoroughfare ?? "Some street")")
                message.append(placemark.thoroughfare ?? "Some street")
                
                print("City info: \(placemark.subLocality ?? "Somewhere")")
                message.append(placemark.subLocality ?? "Somewhere")
                
                print("City: \(placemark.locality ?? "Some city")")
                message.append(placemark.locality ?? "Some city")
                
                print("Administrative area: \(placemark.subAdministrativeArea ?? "Some corporation")")
                message.append(placemark.subAdministrativeArea ?? "Some corporation")
                
                print("Postal code: \(placemark.postalCode ?? "Some post office")")
                message.append(placemark.postalCode ?? "Some post office")
                
                print("Country: \(placemark.country ?? "Some Nation")")
                message.append(placemark.country ?? "Some Nation")
            } else {
                print("No matching address")
            }
            
            let mes = message.map{ String($0) }.joined(separator: "\n")
            let alert = UIAlertController(title: "Address", message: mes, preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default)
            alert.addAction(action)
            self.present(alert, animated: true)
        }
    }
    

}

extension ViewController: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedAlways:
            print("Authorized always")
        case .authorizedWhenInUse:
            print("Authorized when in use")
            locationManager?.requestAlwaysAuthorization()
        case .notDetermined:
            print("Not determined")
        case .restricted:
            print("Restricted")
        case .denied:
            print("Denied")
        default:
            print("Default")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        print("Latitude: \(location.coordinate.latitude)")
        print("Longitude: \(location.coordinate.longitude)")
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print(error)
    }
}
