//
//  MapView.swift
//  WorldTraveler
//
//  Created by Turhan Sel on 26.03.2021.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    static var regions: [MKCoordinateRegion] = [
        MKCoordinateRegion(
            center: CLLocationCoordinate2DMake(40.146720
                                               , 26.408587),
            span: MKCoordinateSpan(latitudeDelta: 3.0, longitudeDelta: 3.0)
        ),
        MKCoordinateRegion(
            center: CLLocationCoordinate2DMake(51.509865, -0.118092),
            span: MKCoordinateSpan(latitudeDelta: 3.0, longitudeDelta: 3.0)
        ),
        MKCoordinateRegion(
            center: CLLocationCoordinate2DMake(36.896891, 30.713323),
            span: MKCoordinateSpan(latitudeDelta: 3.0, longitudeDelta: 3.0)
        )
        
    ]
    
    @State var region: MKCoordinateRegion=regions[0]
    
    @State var selectedIndex = 0
    
    var body: some View {
        Map(coordinateRegion: $region)
            .edgesIgnoringSafeArea(.top)
            .overlay(
                VStack{
                    Picker("Picker", selection: $selectedIndex, content: {
                        Text("MAP_CITY_CANAKKALE").tag(0)
                        Text("MAP_CITY_LONDON").tag(1)
                        Text("MAP_CITY_ANTALYA").tag(2)
                    }).pickerStyle(SegmentedPickerStyle())
                    .padding()
                    .onChange(of: selectedIndex, perform: { value in
                        self.region = MapView.regions[selectedIndex]
                    })
                    Spacer()
                }
                
            )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
