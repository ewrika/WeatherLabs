//
//  ForecastCard.swift
//  WeatherIOS
//
//  Created by Георгий Борисов on 06.01.2024.
//

import SwiftUI

struct ForecastCard: View {
    var forecast : Forecast
    var forecastPeriod : ForecastPeriod
    @ObservedObject var viewModel:WeatherViewModel
    var isActive : Bool {
        if forecastPeriod == ForecastPeriod.hourly{
            let isThisHour = Calendar.current.isDate(.now, equalTo: forecast.date, toGranularity: .hour)
            return isThisHour
        }else{
            let isToday = Calendar.current.isDate(.now, equalTo: forecast.date, toGranularity: .day)
            return isToday
        }
    }
    
    var body: some View {

        ZStack{
            // MARK : Card
            RoundedRectangle(cornerRadius: 10.0)
                .fill(Color.yellow.opacity(isActive ? 1 : 0.2))
                .frame(width: 60,height: 180)
                .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.25), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/,x:5,y: 4)

            
            VStack(spacing:16){
                Text("\(viewModel.temperature)")
                    .font(.title3)
                Text(forecast.date,format:forecastPeriod == ForecastPeriod.hourly ? .dateTime.hour() : .dateTime.weekday())
                    .font(.subheadline.weight(.semibold))
                Image("\(forecast.icon)")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100,height: 100)
                
            }.padding(.horizontal,8)
                .padding(.vertical,16)
                .frame(width: 60,height: 146)
                .onAppear(perform:viewModel.refresh)
        }

    }
}

#Preview {
    ForecastCard(forecast: Forecast.hourly[0], forecastPeriod: .hourly,viewModel: WeatherViewModel(weatherService: WeatherService()))
}
