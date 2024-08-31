//
//  TimerMode.swift
//  PomidoroApp
//
//  Created by Jan Kazubski on 19/07/2024.
//

import Foundation

enum TimerMode: String, CaseIterable {
    case ready = "ready"
    case running = "running"
    case paused = "paused"
    case finished = "finished"

    static func fromString(_ name: String?) -> TimerMode? {
        return if let name = name {
            TimerMode(rawValue: name)
        } else {
            nil
        }
    }
}
