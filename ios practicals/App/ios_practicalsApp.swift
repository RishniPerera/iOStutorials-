//
//  ios_practicalsApp.swift
//  ios practicals
//
//  Created by Student 1 on 2026-06-06.
//

import SwiftUI

@main
struct ios_practicalsApp: App {
    @StateObject var gameSession = GameSession()
    @StateObject var locationService = LocationService()
    var body: some Scene {
        WindowGroup {
            MainTab()
                .environmentObject(gameSession)
                .environmentObject(locationService)
        }
    }
}
