//
//  CurrentLocationView.swift
//  MapKitDemo
//
//  Created by Knoxpo MacBook Pro on 17/02/21.
//

import SwiftUI
import MapKit
struct CurrentLocationView: View {

    var body: some View {
       MapView1()
    }
}


struct MapView1: UIViewRepresentable {
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
    }
    
    typealias UIViewType = MKMapView
    
    var locationManger = CLLocationManager()
    
    func SetUPManager() {
        
        
        locationManger.desiredAccuracy = kCLLocationAccuracyBest
        locationManger.requestWhenInUseAuthorization()
        locationManger.requestAlwaysAuthorization()
        
    }
    
    
    
    func makeUIView(context: Context) -> MKMapView  {
        SetUPManager()
        let mapView = MKMapView(frame: UIScreen.main.bounds)
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        return mapView
        
        
    }
    
    
}


struct CurrentLocationView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentLocationView()
    }
}
