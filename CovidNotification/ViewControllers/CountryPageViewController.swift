//
//  ViewController.swift
//  CovidNotification
//
//  Created by Emir Sürmen on 9.03.2022.
//

import UIKit
import MapKit

class CountryPageViewController: UIViewController {
    var country: CountryCorona!
    
    init(countryData: CountryCorona) {
        self.country = countryData
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @IBOutlet weak var countryFlagImage: UIImageView!
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var countryPopulation: UILabel!
    @IBOutlet weak var lastUpdated: UILabel!
    @IBOutlet weak var countryMap: MKMapView!
    @IBOutlet weak var totalCases: UILabel!
    @IBOutlet weak var casesToday: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize map
        let initialLocation = CLLocation(
            latitude: self.country.countryInfo["lat"] as! Double,
            longitude: self.country.countryInfo["long"] as! Double
        )
        countryMap.centerToLocation(
            location: initialLocation
        )
    }
}

private extension MKMapView {
  func centerToLocation(
    location: CLLocation,
    regionRadius: CLLocationDistance = 1000
  ) {
    let coordinateRegion = MKCoordinateRegion(
      center: location.coordinate,
      latitudinalMeters: regionRadius,
      longitudinalMeters: regionRadius
    )
    setRegion(coordinateRegion, animated: true)
  }
}
