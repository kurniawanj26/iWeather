//
//  LocationManager.swift
//  iWeather
//
//  Created by Jayadi Kurniawan on 17/01/25.
//

import Foundation
import CoreLocation // framework to get user's current location

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    
    @Published var location: CLLocationCoordinate2D? // ? means optional
    @Published var isLoading = false
    
    override init() {
        super .init()
        manager.delegate = self
    }
    
    func requestLocation() {
        isLoading = true
        manager.requestLocation()
    }
    
    // fetch location
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
        isLoading = false
    }
    
    // error handling
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print("Error getting location: ", error)
        isLoading = false
    }
}
