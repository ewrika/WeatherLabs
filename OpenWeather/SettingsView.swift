//
//  SettingsView.swift
//  OpenWeather
//
//  Created by Георгий Борисов on 16.03.2024.
//

import SwiftUI

struct SettingsView: View {
    
    var first:[Platform] = [.init(name:"Units",imageName:"globe",color: .orange),
                            .init(name:"Appearance",imageName: "moon",color:.orange)]
    
    var body: some View {
            NavigationStack {
                Form {
                    Section(header: Text("DISPLAY OPTIONS")) {
                        ForEach(first,id:\.name){ platform in
                            Label(platform.name,systemImage:platform.imageName)
                                .foregroundColor(platform.color)
                        }
                    }

                    Section(header: Text("EXCLUSIVE EXTRAS")) {
                        Text("Updgrade Now") + Text(Image(systemName: "house"))
                        Text("Forecast Data")
                        Text("Radar Options")
                        Text("App Icon")
                        Text("Theme Color")
                        Text("Apple Watch")
                    }
                }

                .navigationBarTitle("Settings")
            }
        }
}

#Preview {
    SettingsView()
}

struct Platform{
    let name:String
    let imageName:String
    let color:Color
}
