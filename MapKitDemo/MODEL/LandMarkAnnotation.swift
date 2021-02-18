//
//  LandMarkAnnotation.swift
//  MapKitDemo
//
//  Created by Knoxpo MacBook Pro on 17/02/21.
//

import Foundation
import MapKit

class LandMarkAnnotation: NSObject,MKAnnotation {
    
    let title: String?
    let subtitle: String?
    let coordinate: CLLocationCoordinate2D
    
    init(title: String?,
         subtitle: String?,
         coordinate: CLLocationCoordinate2D) {
        
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
        
        
    }
    
    static func requestMockData()-> [LandMarkAnnotation]{
        return [
        
        LandMarkAnnotation(title: "Banglore", subtitle: "Welcome to Banglore", coordinate: CLLocationCoordinate2D(latitude: 12.9716, longitude: 77.5946)),
            LandMarkAnnotation(title: "Mumbai", subtitle: "Welcome to Mumbai", coordinate: CLLocationCoordinate2D(latitude: 19.0760, longitude: 72.8777))
    
        
        
        
        ]
        
        
        
        
        
    }
    
    
    
    
    
}
