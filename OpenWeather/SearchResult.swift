//
//  SearchResult.swift
//  OpenWeather
//
//  Created by Георгий Борисов on 18.03.2024.
//

import SwiftUI

struct SearchResult: View {
    @AppStorage("userTheme") private var userTheme: Theme = .systemDefault
        let title:String

        var body: some View {
            HStack{
                Image(systemName: "mappin.circle.fill")
                    .resizable()
                    .foregroundStyle(.blue)
                    .frame(width: 40,height: 40)
                
                VStack(alignment:.leading,spacing: 4){
                    Text(title)
                        .font(.body)
                    Divider()
                    
                }
                .padding(.leading,8)
                .padding(.vertical,8)
                
            }
            .preferredColorScheme(userTheme.colorScheme)
            .padding(.leading)
        }
    }

#Preview {
    SearchResult(title: "Omsk")
}
