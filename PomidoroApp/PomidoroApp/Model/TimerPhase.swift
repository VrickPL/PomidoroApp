//
//  TimerPhase.swift
//  PomidoroApp
//
//  Created by Jan Kazubski on 19/07/2024.
//

import Foundation

enum TimerPhase: String {
    case breakTime = "breakTime"
    case workTime = "workTime"
    
    static func fromString(_ name: String?) -> TimerPhase? {
        return if let name = name {
            TimerPhase(rawValue: name)
        } else {
            nil
        }
    }
    
    func getNotificationTitleString() -> String {
        switch self {
        case .breakTime:
            "notification_title_break_done"
        case .workTime:
            "notification_title_work_done"
        }
    }
    
    func getNotificationBodyString() -> String {
        switch self {
        case .breakTime:
            "notification_body_break_done"
        case .workTime:
            "notification_body_work_done"
        }
    }
}
