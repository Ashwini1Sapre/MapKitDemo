//
//  SearchView.swift
//  MapKitDemo
//
//  Created by Knoxpo MacBook Pro on 18/02/21.
//

import SwiftUI
import MapKit



struct SearchView: View {
    
    @ObservedObject var locationManager = LocationManager()
    @State private var landmarks: [LandMark] = [LandMark]()
    @State private var search: String = ""
    @State private var tapped: Bool = false
    
    
    private func getNearByLandMarks() {
        
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = search
        
        let search = MKLocalSearch(request: request)
        search.start { response,error in
            
            
            if let response = response {
                
                let mapItems = response.mapItems
                self.landmarks = mapItems.map {
                    
                    
                    LandMark(placemark: $0.placemark)
                }
                
            }
            
            
        }
        
        
        
        
    }
    
    
    func calculatoroffSet() -> CGFloat {
        
        if self.landmarks.count > 0 && !self.tapped {
            return UIScreen.main.bounds.size.height - UIScreen.main.bounds.size.height / 4
            
            
            
            
            
        }
        else if self.tapped {
            
            return 100
        } else {
            return UIScreen.main.bounds.size.height
        }
        
        
    }
    
    
    
    
    
    
    
    
    
    
    var body: some View {
        
        
        ZStack(alignment: .top) {
            
            Mapview(landmarks: landmarks)
            TextField("Search", text: $search, onEditingChanged: { _ in })
                {
                
                
                self.getNearByLandMarks()
                
                
            }.textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
            .offset(y: 44)
            
            PlaceListview(landmarks: self.landmarks) {
                self.tapped.toggle()
                
                
                
            }.animation(.spring())
            .offset(y: calculatoroffSet())
            
            
            
            
            
            
            
            
            
        }
        
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
