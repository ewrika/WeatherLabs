//
//  TabBar.swift
//  OpenWeather
//
//  Created by Георгий Борисов on 16.03.2024.
//

import SwiftUI
import MapKit
struct TabBar: View {
    @ObservedObject var viewModel:WeatherViewModel
    @AppStorage("userTheme") private var userTheme: Theme = .systemDefault
    var body: some View {
        TabView() {
            
            ForeCastView(viewModel: WeatherViewModel(weatherService: WeatherService()))
              
                .tabItem { Label("Forecast",systemImage: "chart.bar.xaxis") }.tag(2)
    
            LocationsView()
                .tabItem { Label("Locations",systemImage: "location.magnifyingglass") }.tag(1)
                    
            RadarView()
                .tabItem { Label("Radar",systemImage: "laser.burst") }.tag(3)
            
            SettingsView()
                .tabItem { Label("Settings",systemImage: "gearshape.fill") }.tag(4)
        }
    }
}

#Preview {
    TabBar(viewModel: WeatherViewModel(weatherService: WeatherService()))
        
}
