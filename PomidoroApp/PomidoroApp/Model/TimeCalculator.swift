//
//  TimeCalculator.swift
//  PomidoroApp
//
//  Created by Jan Kazubski on 01/08/2024.
//

import Foundation

class TimeCalculator {
    var time: Int

    init(_ time: Double) {
        self.time = Int(time)
    }
    
    init(_ time: Int) {
        self.time = time
    }

    init(hours: Int, minutes: Int, seconds: Int) {
        self.time = hours * 3600 + minutes * 60 + seconds
    }

    var hours: Int {
        time / 3600
    }

    var minutes: Int {
        time % 3600 / 60
    }

    var seconds: Int {
        time % 60
    }

    func format() -> String {
        if hours > 0 {
            String(format: "%2d:%02d:%02d", hours, minutes, seconds)
        } else {
            String(format: "%02d:%02d", minutes, seconds)
        }
    }
}
