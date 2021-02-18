//
//  LandmarkAnnotationModel.swift
//  MapKitDemo
//
//  Created by Knoxpo MacBook Pro on 18/02/21.
//

import MapKit
import UIKit

final class LandmarkAnnotationModel: NSObject, MKAnnotation {
    let title: String?
    let coordinate: CLLocationCoordinate2D
    
    init(landmark: LandMark) {
        self.title = landmark.name
        self.coordinate = landmark.coordinate
    }
    
    
}
