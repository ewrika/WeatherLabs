//
//  OpenWeatherApp.swift
//  OpenWeather
//
//  Created by Георгий Борисов on 17.01.2024.
//

import SwiftUI

@main
struct OpenWeatherApp: App {
    var body: some Scene {
        WindowGroup {
            
            let weatherService = WeatherService()
            let viewModel = WeatherViewModel(weatherService: weatherService)
            TabBar(viewModel: viewModel)
                
           //ForeCastView(viewModel: viewModel)
        }
    }
}
