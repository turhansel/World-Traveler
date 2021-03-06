//
//  WorldTravelerApp.swift
//  WorldTraveler
//
//  Created by Turhan Sel on 21.03.2021.
//

import SwiftUI

@main
struct WorldTravelerApp: App {
    var body: some Scene {
        WindowGroup {
            TabView{
                ContentView()
                    .tabItem { HStack{
                        Image(systemName: "thermometer")
                        Text("TAB_CONVERSION")
                        
                    }
                }
                MapView()
                    .tabItem { HStack{
                        Image(systemName: "map")
                        Text("TAB_MAP")
                            
                    }
                }
            }.accentColor(.purple)
        }
    }
}
