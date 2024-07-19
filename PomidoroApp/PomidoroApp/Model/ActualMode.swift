//
//  Mode.swift
//  PomidoroApp
//
//  Created by Jan Kazubski on 19/07/2024.
//

import Foundation

enum ActualMode {
    case Break
    case Work
    
    func getNotificationTitleString() -> String {
        switch self {
        case .Break:
            "notification_title_break_done"
        case .Work:
            "notification_title_work_done"
        }
    }
    
    func getNotificationBodyString() -> String {
        switch self {
        case .Break:
            "notification_body_break_done"
        case .Work:
            "notification_body_work_done"
        }
    }
}
