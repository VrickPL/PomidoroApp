//
//  Notifications.swift
//  PomidoroApp
//
//  Created by Jan Kazubski on 19/07/2024.
//

import Foundation
import UserNotifications

class Notifications {
    static func checkAuthorization(completion: @escaping (Bool) -> Void) {
        let notificationCentre = UNUserNotificationCenter.current()
        notificationCentre.getNotificationSettings { settings in
            switch settings.authorizationStatus {
            case .authorized:
                completion(true)
            case .notDetermined:
                notificationCentre.requestAuthorization(options: [.alert, .badge, .sound]) { allowed, error in
                    completion(allowed)
                }
            default:
                completion(false)
            }
        }
    }

    static func scheduleNotification(seconds: TimeInterval, title: String, body: String) {
        stopAllNotifications()

        let notificationCentre = UNUserNotificationCenter.current()
        
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = .default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: seconds, repeats: false)
        let request = UNNotificationRequest(identifier: "notification", content: content, trigger: trigger)
        
        notificationCentre.add(request)
    }
    
    static func stopAllNotifications() {
        let notificationCentre = UNUserNotificationCenter.current()
        
        notificationCentre.removeAllDeliveredNotifications()
        notificationCentre.removeAllPendingNotificationRequests()
    }
}
