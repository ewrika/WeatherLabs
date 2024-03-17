//
//  WeatherViewModel.swift
//  Weather
//

import Foundation

private let defaultIcon = "❓"
private let iconMap = [
  "Drizzle" : "Cloud_Rain_F",
  "Thunderstorm" : "Cloud_Lighting_F",
  "Rain": "Rain_Drop_F",
  "Snow": "Snow_F",
  "Clear": "Sun_F",
  "Clouds" : "Cloud_Basic_F",
]

class WeatherViewModel: ObservableObject {
  @Published var cityName: String = "City Name"
  @Published var temperature: String = "--"
  @Published var weatherDescription: String = "Ветренно"
  @Published var weatherIcon: String = defaultIcon
  @Published var shouldShowLocationError: Bool = false

  public let weatherService: WeatherService

  init(weatherService: WeatherService) {
    self.weatherService = weatherService
  }

  func refresh() {
      print("load api")
    weatherService.loadWeatherData { weather, error in
      DispatchQueue.main.async {
        if let _ = error {
          self.shouldShowLocationError = true
            
          return
        }

        self.shouldShowLocationError = false
        guard let weather = weather else { return }
        self.cityName = weather.city
        self.temperature = "\(weather.temperature)ºC"
        self.weatherDescription = weather.description.capitalized
        self.weatherIcon = iconMap[weather.iconName] ?? defaultIcon
      }
    }
  }
}
