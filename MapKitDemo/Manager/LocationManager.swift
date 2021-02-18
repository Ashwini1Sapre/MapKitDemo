//
//  LocationManager.swift
//  MapKitDemo
//
//  Created by Knoxpo MacBook Pro on 18/02/21.
//

import Foundation
import MapKit

class LocationManager: NSObject,ObservableObject {
    
    private let locationManager = CLLocationManager()
    @Published var location: CLLocation? = nil
    
    override init() {
        
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
            self.locationManager.distanceFilter = kCLDistanceFilterNone
        
            self.locationManager.requestAlwaysAuthorization()
        self.locationManager.stopUpdatingLocation()
    }
    
   
}
extension LocationManager: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print(status)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard  let location = locations.last else {
            return
        }
        
        self.location = location
    }
    
    
    
    
}
