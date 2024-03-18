//
//  Theme.swift
//  OpenWeather
//
//  Created by Георгий Борисов on 19.03.2024.
//
import SwiftUI
import Foundation

enum Theme:String,CaseIterable{
    case systemDefault = "Default"
    case light = "Light"
    case dark = "Dark"
    
    func color(_ scheme: ColorScheme) -> Color {
        switch self{
        case .systemDefault:
            return scheme == .dark ? .moon : .sun
        case .light:
            return .sun
        case .dark:
            return .moon
        }
    }

    var colorScheme:ColorScheme?{
        switch self{
        case .systemDefault:
            return nil
        case .light:
            return .light
        case .dark:
            return .dark
        }
    }
}
