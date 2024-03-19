//
//  TodayWidgetBundle.swift
//  TodayWidget
//
//  Created by Георгий Борисов on 19.03.2024.
//

import WidgetKit
import SwiftUI

@main
struct TodayWidgetBundle: WidgetBundle {
    var body: some Widget {
        TodayWidget()
        TodayWidgetLiveActivity()
    }
}
