//
//  ContentView.swift
//  MapKitDemo
//
//  Created by Knoxpo MacBook Pro on 17/02/21.
//

import SwiftUI
import MapKit

struct place: Identifiable {
    let id = UUID()
    let name: String
    let lat: Double
    let long: Double
    var coordinate: CLLocationCoordinate2D {
        
    CLLocationCoordinate2D(latitude: lat, longitude: long)
        
    }
}


struct MapViewUIKit: UIViewRepresentable {
   
   // let landmarksnew = LandMarkAnnotation.requestMockData()
    
   let region : MKCoordinateRegion
   let mapType : MKMapType
   
    typealias UIViewType = MKMapView
    @Binding var  directions: [String]
  
    
  
  
    
   
    
    
    
    
    
    func makeCoordinator() -> MapViewCoordinate {
      MapViewCoordinate(self)
       // return MapViewCoordinator()
    }
    
    
    class MapViewCoordinator: NSObject, MKMapViewDelegate {
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
          let renderer = MKPolylineRenderer(overlay: overlay)
          renderer.strokeColor = .systemBlue
          renderer.lineWidth = 5
          return renderer
        }
      }
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
       // mapView.setRegion(region, animated: true)
        mapView.mapType = mapType



      //  return mapView
        
        
        
       //   MKMapView(frame: .zero)
    //    let mapView = MKMapView()
        mapView.delegate = context.coordinator
        
   
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.71, longitude: -74), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
        mapView.setRegion(region, animated: true)
        
        let P1 = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 40.71, longitude: -74))
        
        let p2 = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 42.36, longitude: -71.05))
        
        
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: P1)
        request.destination = MKMapItem(placemark: p2)
        request.transportType = .automobile
        
        
        let direction = MKDirections(request: request)
        direction.calculate { response,error in
            guard let route = response?.routes.first else { return }
            
            mapView.addAnnotations([P1, p2])
            mapView.addOverlay(route.polyline)
            mapView.setVisibleMapRect(route.polyline.boundingMapRect, edgePadding: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20), animated: true)
            
            
            self.directions = route.steps.map { $0.instructions }.filter {!$0.isEmpty}
            
            
            
        }
        
        
        
        
        
        
        
        
        return mapView
        
        
    }
    
    func updateUIView(_ view: MKMapView, context: Context){
       
       // view.delegate = context.coordinator
      //  view.addAnnotations(landmarksnew)
        view.mapType = mapType
        
    }
    
    
}


struct ContentView: View {
    
    @State private var dirctions: [String] = []
    @State private var showDirctions = false
    
    @State var isModal: Bool = false
    
    let places  = [place(name: "British Mesuium", lat: 51.519581, long: -0.127002),
    place(name: "Tower of London", lat: 51.508052, long: -0.076035),
    place(name: "Big Ben", lat: 51.500710, long: -0.124617)]
    
    
    
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.50007773, longitude: -0.1246402), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05) )
    @State private var mapType: MKMapType = .standard
    let location = CLLocationCoordinate2D(latitude: 51.50007773, longitude: -0.1246402)
    let annotaion = MKPointAnnotation()
    
    
    var body: some View {
       
        
        
     

        
        
        ZStack {
            
            

            
           
            
            VStack {
                
              
                VStack {
                    
                    MapViewUIKit(region: region, mapType: mapType, directions: $dirctions)
                        
                        
                    
                        .edgesIgnoringSafeArea(.all)
             
                    
                    Button("Route") {
                               self.isModal = true
                           }.sheet(isPresented: $isModal, content: {
                               RouteDemo()
                           })
                    
                    
                    
                    Button(action: {
                        self.showDirctions.toggle()
                        
                        
                        
                    }, label: {
                        Text("Show dirction")
                    })
                    .disabled(dirctions.isEmpty)
                .padding()
                    
                    
                  
                    
                    
                    
                    
                    
                    
                }
                .sheet(isPresented: $showDirctions, content: {
                    VStack(spacing: 0) {
                       Text("Dirction")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                        
                        Divider().background(Color.blue)
                     
            List(0..<self.dirctions.count, id: \.self) { i in
                            
                            Text(self.dirctions[i]).padding()
                            
                            
                            
                        }
                        
                        
                    }
                    
                    
                    
                    
                })
                
                
                
                
                
                Spacer()
                Picker("", selection: $mapType) {
                    
                    Text("Standard").tag(MKMapType.standard)
                    
                    Text("Satelite").tag(MKMapType.satellite)
                    Text("Hybrid").tag(MKMapType.hybrid)
                    
                    
                    
                    
                }
                
                .pickerStyle(SegmentedPickerStyle())
                .offset (y: -20)
                .font(.largeTitle)
                
                
            }
            
            
            
        }
            
            
            
            
            
            
        }
           // .edgesIgnoringSafeArea(.all)
      //  .ignoresSafeArea(.all)
    
    
    func showView() {
        
        RouteDemo()
        
        
    }
    
    
    
    
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
