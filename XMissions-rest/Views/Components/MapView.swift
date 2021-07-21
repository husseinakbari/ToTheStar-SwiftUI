//
//  Map.swift
//  XMissions-rest
//
//  Created by Hossein Akbari on 4/26/1400 AP.
//

import SwiftUI
import MapKit

struct MapView: View {
    private var annotations = [Coordinate]()
    
    @State private var regionMap: MKCoordinateRegion
    
    init(latitude: CLLocationDegrees, longitude: CLLocationDegrees, zoomLevel: CLLocationDegrees = 0.5, tint: Color = .red) {
        
        self.annotations.append(Coordinate(latitude: latitude, longitude: longitude, tint: tint))
        
        regionMap = {
            var newRegion = MKCoordinateRegion()
            newRegion.center.latitude = latitude
            newRegion.center.longitude = longitude
            newRegion.span.latitudeDelta = zoomLevel
            newRegion.span.longitudeDelta = zoomLevel
            return newRegion
        }()
    }
    
    var body: some View {
        VStack {
            Map(coordinateRegion: $regionMap, annotationItems: annotations) { place in
                MapPin(coordinate: place.coordinate, tint: place.tint)
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(latitude: 51.519581, longitude: -0.127002)
    }
}
