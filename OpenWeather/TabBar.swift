//
//  TabBar.swift
//  OpenWeather
//
//  Created by Георгий Борисов on 16.03.2024.
//

import SwiftUI

struct TabBar: View {
    @ObservedObject var viewModel:WeatherViewModel
    @State var isPresenting:Bool = false
    @State private var selectedItem = 1
    @State private var oldSelectedItem = 1
    var body: some View {
        TabView(selection: $selectedItem) {
            
            
            Text("")
                .tabItem { Label("Locations",systemImage: "location.magnifyingglass") }.tag(1)
            
            ContentView(viewModel: WeatherViewModel(weatherService: WeatherService()))
                .tabItem { Label("Forecast",systemImage: "chart.bar.xaxis") }.tag(2)
                
            
            Text("Radar")
                .tabItem { Label("Radar",systemImage: "laser.burst") }.tag(3)
            
            Text("Settings")
                .tabItem { Label("Settings",systemImage: "gearshape.fill") }.tag(4)
        }
        .onChange(of: selectedItem) {    // SwiftUI 2.0 track changes
                        if 1 == selectedItem {
                        self.isPresenting = true
                        } else {
                            self.oldSelectedItem = $0
                        }
                    }
                .sheet(isPresented: $isPresenting, onDismiss: {
                        self.selectedItem = self.oldSelectedItem
                    }) {
                    LocationsView()
                    }.accentColor(.green)
    }
}

#Preview {
    TabBar(viewModel: WeatherViewModel(weatherService: WeatherService()))
}
