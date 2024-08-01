//
//  UserDefaultsManager.swift
//  PomidoroApp
//
//  Created by Jan Kazubski on 19/07/2024.
//

import Foundation

class UserDefaultsManager {
    static let defaultWorkTime = 1500
    static let defaultBreakTime = 300

    private struct Keys {
        static let TIMER_START_DATE = "timer_start_date"
        static let TIMER_END_DATE = "timer_end_date"
        static let MODE = "mode"
        static let TIMER_MODE = "timer_mode"
        static let SECONDS_LEFT_AFTER_PAUSE = "seconds_left_after_pause"
    }

    static var workTime: Int {
        return userDefaults.integer(forKey: AppStorageKeys.WORK_TIME)
    }

    static var breakTime: Int {
        return userDefaults.integer(forKey: AppStorageKeys.BREAK_TIME)
    }

    static var startDate: Date? {
        return userDefaults.object(forKey: Keys.TIMER_START_DATE) as? Date
    }

    static var endDate: Date? {
        return userDefaults.object(forKey: Keys.TIMER_END_DATE) as? Date
    }

    static var mode: ActualMode? {
        guard let modeString = userDefaults.string(forKey: Keys.MODE) else {
            return nil
        }
        return ActualMode.fromString(modeString)
    }

    static var timerMode: TimerMode? {
        guard let timerModeString = userDefaults.string(forKey: Keys.TIMER_MODE)
        else { return nil }
        return TimerMode.fromString(timerModeString)
    }

    static var secondsLeftAfterPause: Int {
        return userDefaults.integer(forKey: Keys.SECONDS_LEFT_AFTER_PAUSE)
    }

    static func register() {
        if workTime == 0 {
            setWorkTime(seconds: defaultWorkTime)
        }
        if breakTime == 0 {
            setBreakTime(seconds: defaultBreakTime)
        }
    }

    static func setWorkTime(seconds: Int) {
        userDefaults.set(seconds, forKey: AppStorageKeys.WORK_TIME)
    }

    static func setBreakTime(seconds: Int) {
        userDefaults.set(seconds, forKey: AppStorageKeys.BREAK_TIME)
    }

    static func setDates(startDate: Date, secondsLeft: TimeInterval) {
        userDefaults.set(startDate, forKey: Keys.TIMER_START_DATE)
        userDefaults.set(
            startDate.addingTimeInterval(secondsLeft),
            forKey: Keys.TIMER_END_DATE)
    }

    static func resetTimer() {
        userDefaults.removeObject(forKey: Keys.TIMER_START_DATE)
        userDefaults.removeObject(forKey: Keys.TIMER_END_DATE)
    }

    static func setMode(mode: ActualMode) {
        userDefaults.set(mode.rawValue, forKey: Keys.MODE)
    }

    static func setTimerMode(timerMode: TimerMode) {
        userDefaults.set(timerMode.rawValue, forKey: Keys.TIMER_MODE)
    }

    static func clearTimerMode() {
        userDefaults.removeObject(forKey: Keys.TIMER_MODE)
    }

    static func setSecondsLeftAfterPause(secondsLeft: TimeInterval) {
        userDefaults.set(secondsLeft, forKey: Keys.SECONDS_LEFT_AFTER_PAUSE)
    }

    private static var userDefaults: UserDefaults {
        return UserDefaults.standard
    }
}
