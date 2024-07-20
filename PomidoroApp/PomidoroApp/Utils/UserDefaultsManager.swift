//
//  UserDefaultsManager.swift
//  PomidoroApp
//
//  Created by Jan Kazubski on 19/07/2024.
//

import Foundation

class UserDefaultsManager {
    static var workTime: Int { UserDefaults.standard.integer(forKey: Keys.WORK_TIME) }
    static var breakTime: Int { UserDefaults.standard.integer(forKey: Keys.BREAK_TIME) }
    static var startDate: Date? { UserDefaults.standard.object(forKey: Keys.TIMER_START_DATE) as? Date }
    static var endDate: Date? { UserDefaults.standard.object(forKey: Keys.TIMER_END_DATE) as? Date }
    static var mode: ActualMode? { ActualMode.fromString(UserDefaults.standard.string(forKey: Keys.MODE)) }
    static var timerMode: TimerMode? { TimerMode.fromString(UserDefaults.standard.string(forKey: Keys.TIMER_MODE)) }
    static var secondsLeftAfterPause: Int { UserDefaults.standard.integer(forKey: Keys.SECONDS_LEFT_AFTER_PAUSE) }

    static func register() {
        let userDefaults = UserDefaults.standard
        let defaultValues = [
            Keys.WORK_TIME: 15,
            Keys.BREAK_TIME: 8
        ]
        userDefaults.register(defaults: defaultValues)
    }
    
    static func setDates(startDate: Date, secondsLeft: TimeInterval) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(startDate, forKey: Keys.TIMER_START_DATE)
        userDefaults.set(startDate.addingTimeInterval(secondsLeft), forKey: Keys.TIMER_END_DATE)
    }
    
    static func resetTimer() {
        let userDefaults = UserDefaults.standard
        userDefaults.removeObject(forKey: Keys.TIMER_START_DATE)
        userDefaults.removeObject(forKey: Keys.TIMER_END_DATE)
    }
    
    static func setMode(mode: ActualMode) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(mode.rawValue, forKey: Keys.MODE)
    }
    
    static func setTimerMode(timerMode: TimerMode) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(timerMode.rawValue, forKey: Keys.TIMER_MODE)
    }
    
    static func clearTimerMode() {
        let userDefaults = UserDefaults.standard
        userDefaults.removeObject(forKey: Keys.TIMER_MODE)
    }
    
    static func setSecondsLeftAfterPause(secondsLeft: TimeInterval) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(secondsLeft, forKey: Keys.SECONDS_LEFT_AFTER_PAUSE)
    }
}
