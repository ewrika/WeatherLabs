//
//  DonateView.swift
//  OpenWeather
//
//  Created by Георгий Борисов on 17.03.2024.
//

import SwiftUI

struct DonateView: View {
    @Environment(\.dismiss) var dismiss

        var body: some View {
            
            NavigationView{
                List{
                    
                }.navigationTitle("Hello Upgrades")
                
                    .toolbar{
                        Button{
dismiss()
                        }label: {
                            Text("Done")
                                .font(.system(size: 20))
                                .font(.title)
                        }
                    }
                    
            }
        }
}

#Preview {
    DonateView()
}
