//
//  PlaceListview.swift
//  MapKitDemo
//
//  Created by Knoxpo MacBook Pro on 18/02/21.
//


import SwiftUI
import MapKit
struct PlaceListview: View {
    
    let landmarks: [LandMark]
    var onTap: () -> ()
    
    
  var body: some View
  {
    VStack(alignment: .leading) {
        HStack {
            EmptyView()
            
            
            
        }.frame(width: 300, height: 60)
        
        .background(Color.gray)
        .gesture(TapGesture()
                    .onEnded(self.onTap)
        )
        
        
        List {
            ForEach(self.landmarks, id: \.id) { landmark in
                
                
                VStack(alignment: .leading) {
                    
                    Text(landmark.name)
                        .fontWeight(.bold)
                    Text(landmark.title)
                    
                    
                }
                
                
                
                
            }
            
            
            
        }.animation(nil)
        
        
        
        
    }.cornerRadius(10)
  
    
    
    
    
    
    
  }
    
    
    
    
    
    
    
    
}



struct PlaceListview_Previews: PreviewProvider {
    
    static var previews: some View {
        
        PlaceListview(landmarks: [LandMark(placemark: MKPlacemark())], onTap: {})
    }
    
    
}





