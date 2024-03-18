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
            Button("Press to dismiss") {
                dismiss()
            }
            .font(.title)
            .padding()
            .background(.black)
        }
}

#Preview {
    DonateView()
}
