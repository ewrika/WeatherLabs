//
//  SettingsView.swift
//  OpenWeather
//
//  Created by Георгий Борисов on 16.03.2024.
//

import SwiftUI

struct SettingsView: View {
    

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("DISPLAY OPTIONS")) {
                    HStack {
                        ZStack{
                            RoundedRectangle(cornerRadius: 5)
                                .frame(width: 30, height: 30)
                                .foregroundStyle(.orange)
                            Image(systemName: "globe")
                                .foregroundStyle(.white)
                        }
                        Text("Units")
                    }
                    HStack {
                        ZStack{
                            RoundedRectangle(cornerRadius: 5)
                                .frame(width: 30, height: 30)
                                .foregroundStyle(.orange)
                            Image(systemName: "moon.fill")
                                .foregroundStyle(.white)
                        }
                        Text("Appereance")
                    }
                }
                
                Section(header: Text("EXCLUSIVE EXTRAS")) {
                    HStack {
                        ZStack{
                            RoundedRectangle(cornerRadius: 5)
                                .frame(width: 30, height: 30)
                                .foregroundStyle(.indigo)
                            Image(systemName: "heart.fill")
                                .foregroundStyle(.white)
                        }
                        Text("Updgrade Now")
                    }

                }
            }
        }
                .navigationBarTitle("Settings")
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
