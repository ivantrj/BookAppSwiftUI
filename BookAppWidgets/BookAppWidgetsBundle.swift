//
//  BookAppWidgetsBundle.swift
//  BookAppWidgets
//
//  Created by Maros Petrus on 24/03/2024.
//

import WidgetKit
import SwiftUI

@main
struct BookAppWidgetsBundle: WidgetBundle {
    var body: some Widget {
        BookAppWidgets()
        BookAppWidgetsLiveActivity()
    }
}
