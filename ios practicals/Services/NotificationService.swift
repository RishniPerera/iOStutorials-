//
//  NotificationService.swift
//  ios practicals
//
//  Created by Student 1 on 2026-07-10.
//

import Foundation
import UserNotifications


class NotificationService {

    static let shared = NotificationService()

    private init() {}


    func requestPermission() {

        UNUserNotificationCenter.current()
            .requestAuthorization(
                options: [.alert, .badge, .sound]
            ) { granted, error in

                if let error = error {
                    print("Notification permission error: \(error)")
                }

                print("Permission granted: \(granted)")
            }
    }


    func sendTestNotification() {

        let content = UNMutableNotificationContent()

        content.title = "PlayHub Reminder"
        content.body = "Come back and play your favourite games!"
        content.sound = .default


        let trigger = UNTimeIntervalNotificationTrigger(
            timeInterval: 5,
            repeats: false
        )


        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger
        )


        UNUserNotificationCenter.current()
            .add(request)
    }
}
