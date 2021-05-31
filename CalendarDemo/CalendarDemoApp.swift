//
//  CalendarDemoApp.swift
//  CalendarDemo
//
//  Created by Dmitrijs Beloborodovs on 31/05/2021.
//

import SwiftUI

@main
struct CalendarDemoApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView(viewModel: HomeViewModel())
        }
    }
}
