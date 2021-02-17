//
//  MapViewCoordinate.swift
//  MapKitDemo
//
//  Created by Knoxpo MacBook Pro on 17/02/21.
//

import Foundation
import MapKit


class MapViewCoordinate: NSObject,MKMapViewDelegate {
    
    var mapviewController: MapViewUIKit
    init(_ control: MapViewUIKit) {
        self.mapviewController = control
    }
    
    func mapView(_ mapview: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?
    {
        let annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "custumview")
        
        annotationView.canShowCallout = true
        
        annotationView.image = UIImage(named: "locationPin")
        return annotationView
    }
    
    
}
