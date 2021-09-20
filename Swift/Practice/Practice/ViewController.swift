//
//  ViewController.swift
//  Practice
//
//  Created by 박연배 on 2021/09/04.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet var phoneButtons: [CircleButton]!
    @IBOutlet weak var phoneCallButton: CircleButton!
    @IBOutlet weak var backButton: UIButton!
    let locationManager = CLLocationManager()
    var phoneNumberString = "" {
        didSet {
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.phoneNumberLabel.text = self.phoneNumberString
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
        
        // 버튼에 대한 이벤트 처리
        for btnitem in phoneButtons {
            btnitem.addTarget(self, action: #selector(buttonClicked(_:)), for: .touchUpInside)
        }
        phoneCallButton.addTarget(self, action: #selector(callButtonClicked(_:)), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(backButtonClicked(_:)), for: .touchUpInside)
    }
    
    
    @objc fileprivate func buttonClicked(_ sender: UIButton) {
        guard let inputString = sender.titleLabel?.text else { return }
        phoneNumberString.append(inputString)
    }
    
    @objc fileprivate func callButtonClicked(_ sender: UIButton) {
        phoneNumberString.removeAll()
    }
    
    @objc fileprivate func backButtonClicked(_ sender: UIButton) {
        if !phoneNumberString.isEmpty {
            phoneNumberString.removeLast()
        }
    }
    
}

extension ViewController : CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            print("Location data received.")
            print(location)
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to get users location.")
    }
}
