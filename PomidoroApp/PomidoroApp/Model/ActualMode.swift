//
//  Mode.swift
//  PomidoroApp
//
//  Created by Jan Kazubski on 19/07/2024.
//

import Foundation

enum ActualMode: String {
    case breakTime = "breakTime"
    case workTime = "workTime"
    
    static func fromString(_ name: String?) -> ActualMode? {
        return if let name = name {
            ActualMode(rawValue: name.lowercased())
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
