//
//  SegmentedControl.swift
//  WeatherIOS
//
//  Created by Георгий Борисов on 04.01.2024.
//

import SwiftUI

struct SegmentedControl: View {
    @Binding var selection : Int
    var body: some View {
        VStack(spacing: 5){
            HStack{
                Button{
                    withAnimation(.easeInOut(duration: 0.5)){
                        selection = 0

                    }
                }label: {
                    Text("Погода")
                        .font(.system(size: 20))
                        .font(.title)
                        .fontWeight(.black)
                }
                .frame(minWidth: 0,maxWidth: .infinity)
                Button{
                    withAnimation(.easeInOut(duration: 0.5)){
                        selection = 1

                    }
                }label: {
                    Text("Информация")
                        .font(.system(size: 20))
                        .font(.title)
                        .fontWeight(.black)
                }
                .frame(minWidth: 0,maxWidth: .infinity)

            }
            .font(.subheadline.weight(.semibold))
            .foregroundColor(.secondary)
            
            Divider()
                .background(.white.opacity(0.5))
                .blendMode(.overlay)
                .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.2), radius: 0,x:0,y:1)
                .blendMode(.overlay)
                .overlay{
                    HStack {
                        Divider()
                            .frame(width: UIScreen.main.bounds.width / 2, height: 3)
                            .background(Color.underline)
                        
                    }
                    .frame(maxWidth: .infinity,alignment: selection == 0 ? .leading : .trailing)
                    .offset(y:-1)
                }
        }
        .padding(.top,25)
    }
}

#Preview {
    SegmentedControl(selection: .constant(0))
}
