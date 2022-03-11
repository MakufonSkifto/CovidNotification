//
//  SelectCountryViewController.swift
//  CovidNotification
//
//  Created by Emir Sürmen on 11.03.2022.
//

import UIKit
import CountryPicker

class SelectCountryViewController: UIViewController, CountryPickerDelegate {
    @IBOutlet weak var selectCountryButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func selectCountryTapped() {
        let countryPicker = CountryPickerViewController()
        CountryManager.shared.localeIdentifier = "en_US"
        
        countryPicker.delegate = self
        
        present(countryPicker, animated: true)
    }
    
    func countryPicker(didSelect countrySelected: Country) {
        let storage = UserDefaults.standard
        let request = Request()
        request.getCountryCoronaInfo(countryCode: countrySelected.isoCode) { (result) in
            switch result {
                case .success(let country):
                    let countryPage = CountryPageViewController(countryData: country)
                    storage.set(countrySelected.isoCode, forKey: "country")
                
                    self.present(countryPage, animated: true)
                case .failure(_):
                    print("An error happened")
            }
        }
    }
}
