//
//  MapView.swift
//  Africa
//
//  Created by Samuel Brehm on 20/04/21.
//

import SwiftUI
import MapKit

struct MapView: View {
    // MARK: PROPERTIES
    
    @State private var region: MKCoordinateRegion = {
        var mapCoordanates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordanates, span: mapZoomLevel)
        
        return mapRegion
    }()
    
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    // MARK: - BODY
    var body: some View {
        // MARK: - Nº 1 BASIC MAP
//        Text("Map")
//        Map(coordinateRegion: $region)
        
        // MARK: - Nº 2 ADVANCED MAP
        Map(coordinateRegion: $region, annotationItems: locations, annotationContent: {
            item in
            // (A) PIN: OLD STYLE (always static)
            // MapPin(coordinate: item.location, tint: .accentColor)
            
            // (B) MARKER: NEW STYLE (always static)
            // MapMarker(coordinate: item.location, tint: .accentColor)
            
            // (C) CUSTOM BASIC ANNOATATION (it cloud be interactive)
            // MapAnnotation(coordinate: item.location) {
            //     Image("logo")
            //         .resizable()
            //         .scaledToFit()
            //         .frame(width: 32, height: 32)
            // } //: ANNOTATION
            
            // (D) CUSTOM ADVANCED ANNOTATION (it could be interactive)
            MapAnnotation(coordinate: item.location) {
                MapAnnotationView(location: item)
            }
        }) //: MAP
        .overlay(
            HStack(alignment: .center, spacing: 12) {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48, alignment: .center)
                
                VStack(alignment: .leading, spacing: 3) {
                    HStack {
                        Text("Latitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    } //: HSTACK
                    
                    Divider()
                    
                    HStack {
                        Text("Longitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    } //: HSTACK
                    
                } //: VSTACK
                
            } //: HSTACK
            .padding(.vertical, 12)
            .padding(.horizontal, 12)
            .background(
                Color.black
                    .cornerRadius(8)
                    .opacity(0.6)
            )
            .padding()
            , alignment: .top
        )
    }
}

// MARK: - PREVIEW
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
