

import Foundation

enum ForecastPeriod {
    case hourly
    case weekly
}

enum WeatherDara: String {
    case Drizzle = "Drizzle"
    case Thunderstorm = "Thunderstorm"
    case Rain = "Rain"
    case Snow = "Snow"
    case Clear = "Clear"
    case Clouds = "Clouds"
}



struct Forecast: Identifiable {
    var id = UUID()
    var date: Date
    var weather: WeatherDara
    var probability: Int
    var temperature: Int

    
    var icon: String {
        switch weather {
        case .Drizzle:
            return "Cloud_Rain_F"
        case .Thunderstorm:
            return "Snow_F"
        case .Rain:
            return "Rain_Drop_F"
        case .Snow:
            return "Snow_F"
        case .Clear:
            return "Sun_F"
        case .Clouds:
            return "Cloud_Basic_F"
        }
    }
}

extension Forecast {
    static let hour: TimeInterval = 60 * 60
    static let day: TimeInterval = 60 * 60 * 24
    
    static let hourly: [Forecast] = [
        Forecast(date: .init(timeIntervalSinceNow: hour * -1), weather: .Drizzle, probability: 30, temperature: 19),
        Forecast(date: .now, weather: .Thunderstorm, probability: 0, temperature: 19),
        Forecast(date: .init(timeIntervalSinceNow: hour * 1), weather: .Rain, probability: 0, temperature: 19),
        Forecast(date: .init(timeIntervalSinceNow: hour * 2), weather: .Snow, probability: 0, temperature: 18),
        Forecast(date: .init(timeIntervalSinceNow: hour * 3), weather: .Clear, probability: 0, temperature: 19),
        Forecast(date: .init(timeIntervalSinceNow: hour * 4), weather: .Clouds, probability: 0, temperature: 19)
    ]
}

