//
//  SettingsTab.swift
//  ios practicals
//
//  Created by Student 1 on 2026-07-07.
//

import SwiftUI

struct SettingsTab: View {
    @EnvironmentObject var gameSession: GameSession
    @State private var notifications = true
    @State private var soundEffects = true
    @AppStorage("darkMode")private var darkMode = false

    var body: some View {
        Form {
            Section("Notifications") {
            Toggle(
                "Enable Notifications",
                isOn: $notifications
            )
                Button("Send Test Notification") {
                    NotificationService.shared.sendTestNotification()
                }}
            
            
            Section("Game Settings") {
                Toggle(
                    "Sound Effects",
                    isOn: $soundEffects
                )
                Button("Reset Scores") {
                    gameSession.games.removeAll()

                }
                .foregroundColor(.red)
            }

            
            Section("Appearance") {
                Toggle(
                    "Dark Mode",
                    isOn: $darkMode
                )
            }


            Section("About") {
                Text("Play Hub")
                    .font(.headline)
                Text("A collection of three mini games built using SwiftUI.")
                Text("Version 1.0")

            }
        }
        .navigationTitle("Settings")
    }
}

#Preview {
    SettingsTab()
}
