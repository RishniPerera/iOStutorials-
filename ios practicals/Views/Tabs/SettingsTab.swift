//
//  SettingsTab.swift
//  ios practicals
//
//  Created by Student 1 on 2026-07-07.
//

import SwiftUI

struct SettingsTab: View {

    @State private var notifications = true

    var body: some View {

        Form {

            Toggle(
                "Enable Notifications",
                isOn: $notifications
            )
            Button("Send Test Notification") {

                            NotificationService.shared.sendTestNotification()

                        }
            Button("Reset Scores") {
                // later we add reset logic
            }

        }
        .navigationTitle("Settings")
    }
}

#Preview {
    SettingsTab()
}
