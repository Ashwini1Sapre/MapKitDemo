//
//  LandMark.swift
//  MapKitDemo
//
//  Created by Knoxpo MacBook Pro on 18/02/21.
//

import Foundation
import MapKit

struct LandMark {
    let placemark: MKPlacemark
    
    var id: UUID {
        
        return UUID()
    }
   
    var name: String {
        
        
        self.placemark.name ?? ""
    }
    
    var title: String {
        
        self.placemark.title ?? ""
        
    }
    
    var coordinate: CLLocationCoordinate2D {
        
        self.placemark.coordinate
    }
    
    
}
