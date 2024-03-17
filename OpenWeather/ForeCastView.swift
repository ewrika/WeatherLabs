//
//  ForeCastView.swift
//  OpenWeather
//
//  Created by Георгий Борисов on 16.03.2024.
//

import SwiftUI

struct ForeCastView: View {
    @ObservedObject var viewModel:WeatherViewModel
    
    var body: some View {
        
        VStack {
            HStack() {
                Text(viewModel.cityName)
                    .foregroundStyle(.green)
                Spacer()
                Text(Image(systemName: "square.and.arrow.up"))
                    .foregroundStyle(.green)
            }.padding()
                .onAppear(perform:viewModel.refresh)
            Divider()
            
            
            
            VStack(alignment:.leading,spacing: 2){
                Text("Right now")
                    .font(.system(size: 40))
                    .font(.title)
                    .fontWeight(.bold)
                Text(viewModel.weatherDescription)
                
                    .fontWeight(.thin)
                Text("17-32mph")
                    .fontWeight(.thin)
                
                VStack(alignment:.leading) {
                    HStack{
                        Image(viewModel.weatherIcon)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200,height: 200)
                        
                        VStack {
                            Text(viewModel.temperature)
                                .font(.system(size: 50))
                                .fontWeight(.bold)
                            
                            Text("Feels like "+viewModel.temperature)
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                                .foregroundStyle(.secondary)
                            
                        }
                    }
                }.onAppear(perform:viewModel.refresh)
                
                
                HStack{
                    VStack{
                        ZStack{
                            Circle()
                                .frame(width: 30,height: 30)
                                .foregroundStyle(.indigo)
                            Image(systemName: "arrow.up.forward").foregroundColor(.white)
                        }
                        Text(Image(systemName: "drop.fill")).foregroundStyle(.gray).font(.system(size:30))
                        ZStack{
                            Ellipse().fill(LinearGradient(gradient:Gradient(colors: [.red,.yellow,.green]),startPoint: .top,endPoint: .bottom))
                                .frame(width: 30,height: 30)
                            Image(systemName: "arrow.down")
                                .foregroundColor(.white)
                        }
                        Text(Image(systemName: "sun.horizon")).foregroundStyle(.yellow).font(.system(size:30))
                        Text(Image(systemName: "3.circle.fill")).foregroundStyle(.yellow).font(.system(size:30))
                    }
                    VStack(alignment:.leading,spacing:25){
                        Text("18-33mph winds from the southwest")
                        Text("Humidity 54% ")
                        Text("Pressure 1005hPA and falling")
                        Text("Sunrise 6:59 -> Sunset 18:58")
                        Text("Moderate UV levels")
                    }
                }.padding()
                
                Button(action: {
                    print("Yes")
                    
                }
                ) {
                    Text("Complications that refresh more often!\n Updgrade now ->")
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.white, lineWidth: 0)
                        )
                }
                .padding()
                .background(Color.indigo)
                .cornerRadius(25)
                
            }
        }
    }}
#Preview {
    ForeCastView(viewModel: WeatherViewModel(weatherService: WeatherService()))
}

