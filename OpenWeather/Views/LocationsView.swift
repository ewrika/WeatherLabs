//
//  LocationsView.swift
//  OpenWeather
//
//  Created by Георгий Борисов on 16.03.2024.
//

import SwiftUI

struct LocationsView: View {
    @State private var search: String = ""
    @State private var locationService = LocationService(completer: .init())
    @AppStorage("userTheme") private var userTheme: Theme = .systemDefault
    var body: some View {
        VStack{
            HStack{
                Text("Search Locations")
            }.frame(maxWidth: .infinity,alignment: .leading)
            
            HStack{
                Image(systemName:"magnifyingglass")
                TextField("Find locations here",text:$search)
                    .autocorrectionDisabled()
            }
            .padding(.vertical,12)
            .padding(.horizontal)
            .background(
                RoundedRectangle(cornerRadius: 10,style:.continuous)
                    .strokeBorder(.gray)
            )
            Divider()
            List{
                ForEach(locationService.completions){completion in
                    Button(action: { }) {
                        VStack(alignment: .leading) {
                            SearchResult(title:completion.title)
                                .onTapGesture {
                                    
                                }
                                .font(.headline)
                                .fontDesign(.rounded)
                        }
                    }
                }
            }
            
            .onChange(of: search) {
                locationService.update(queryFragment: search)}
        }
    }
}
#Preview {
    LocationsView()
}
