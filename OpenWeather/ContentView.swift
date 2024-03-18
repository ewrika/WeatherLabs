//
//  ContentView.swift
//  OpenWeather
//
//  Created by Георгий Борисов on 17.01.2024.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel:WeatherViewModel
    
    var body: some View {
        
             VStack {
             Text(viewModel.cityName)
             .font(.largeTitle)
             .padding()
             Text(viewModel.temperature)
             .font(.system(size:70))
             .bold()
             Text(viewModel.weatherIcon)
             .font(.largeTitle)
             .padding()
             Text(viewModel.weatherDescription)
             }//.onAppear(perform:viewModel.refresh)
            
             .padding()

             }
             
        }
        
#Preview {
    //ContentView()
    ContentView(viewModel: WeatherViewModel(weatherService: WeatherService()))
}
