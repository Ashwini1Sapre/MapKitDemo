//
//  RouteDemo.swift
//  MapKitDemo
//
//  Created by Knoxpo MacBook Pro on 17/02/21.
//

import SwiftUI
import MapKit
struct RouteDemo: View {
    var body: some View {
      MapView()
    }
}

struct MapView: UIViewRepresentable {
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
    }
    
    typealias UIViewType = MKMapView
    
  
    
    func makeCoordinator() -> MapViewCoordinator{
        return MapViewCoordinator()
    }
    
    
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
    
    let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.71, longitude: -74), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
        mapView.setRegion(region, animated: true)
        
        let p1 = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 40.71, longitude: -74))
        
        let p2 = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 42.36, longitude: -71.05))
        
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: p1)
        
        request.destination = MKMapItem(placemark: p2)
        request.transportType = .automobile
        
        
        let directions = MKDirections(request: request)
        directions.calculate { response,error in
            
            
            guard let route = response?.routes.first else { return }
            
            mapView.addAnnotations([p1, p2])
            mapView.addOverlay(route.polyline)
            mapView.setVisibleMapRect(route.polyline.boundingMapRect,
                 edgePadding: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20), animated: true)
            
        }
        
        
        
        
        
        
        return mapView
    }
    
    
    class MapViewCoordinator: NSObject, MKMapViewDelegate {
        
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            
            
      //   let render = MKPolygonRenderer(overlay: overlay)
            let render = MKPolylineRenderer(overlay: overlay)
            render.strokeColor = .systemBlue
            render.lineWidth = 5
            return render
            
            
            
            
            
        }
        
        
        
        
        
        
    }
    
    
    
    
    
}



struct RouteDemo_Previews: PreviewProvider {
    static var previews: some View {
        RouteDemo()
    }
}
