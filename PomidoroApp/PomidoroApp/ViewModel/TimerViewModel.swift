//
//  TimerViewModel.swift
//  PomidoroApp
//
//  Created by Jan Kazubski on 19/07/2024.
//

import Foundation
import Observation

@Observable
class TimerViewModel {
    var secondsRemaining: TimeInterval = 0

    var timerPhase: TimerPhase
    var timerMode: TimerMode
    
    var timerFinished = false

    private var timer: Timer?

    var baseTime: TimeInterval {
        return switch timerPhase {
        case .breakTime:
            TimeInterval(UserDefaultsManager.breakTime)
        case .workTime:
            TimeInterval(UserDefaultsManager.workTime)
        }
    }

    init() {
        self.timerPhase = UserDefaultsManager.phase ?? .workTime
        self.timerMode = UserDefaultsManager.timerMode ?? .ready

        if timerMode == .paused {
            self.secondsRemaining = TimeInterval(
                UserDefaultsManager.secondsLeftAfterPause)
        } else {
            if let endDate = UserDefaultsManager.endDate {
                let now = Date.now

                if now > endDate {
                    stopTimer()
                    changePhase()
                    self.secondsRemaining = baseTime
                    self.timerMode = .ready
                    UserDefaultsManager.clearTimerMode()
                } else {
                    self.secondsRemaining = endDate.timeIntervalSince(now)
                    start()
                }
            } else {
                self.secondsRemaining = baseTime
                UserDefaultsManager.clearTimerMode()
            }
        }
    }

    func start() {
        timerMode = .running
        UserDefaultsManager.setTimerMode(timerMode: timerMode)

        startTimer()
    }

    func pause() {
        timerMode = .paused
        UserDefaultsManager.setTimerMode(timerMode: timerMode)
        UserDefaultsManager.setSecondsLeftAfterPause(
            secondsLeft: secondsRemaining)
        stopTimer()
    }

    func resume() {
        UserDefaultsManager.setDates(
            startDate: Date.now, secondsLeft: secondsRemaining)
        timerMode = .running
        UserDefaultsManager.setTimerMode(timerMode: timerMode)

        Notifications.scheduleNotification(
            seconds: secondsRemaining,
            title: timerPhase.getNotificationTitleString(),
            body: timerPhase.getNotificationBodyString()
        )

        startTimer()
    }

    func reset() {
        stopTimer()
        timerMode = .ready
        UserDefaultsManager.clearTimerMode()
        secondsRemaining = baseTime
    }

    func skip() {
        stopTimer()
        timerMode = .ready
        UserDefaultsManager.clearTimerMode()
        changePhase()
        secondsRemaining = baseTime
    }

    private func startTimer() {
        if UserDefaultsManager.endDate == nil {
            UserDefaultsManager.setDates(
                startDate: Date.now, secondsLeft: secondsRemaining)

            Notifications.scheduleNotification(
                seconds: secondsRemaining,
                title: timerPhase.getNotificationTitleString(),
                body: timerPhase.getNotificationBodyString()
            )
            
            if self.secondsRemaining > 1 {
                self.secondsRemaining -= 1
            }
        }

        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            switch self.timerMode {
            case .running:
                if self.secondsRemaining > 1 {
                    self.secondsRemaining -= 1
                } else {
                    self.timerFinished = true
                    self.changePhase()
                    self.reset()
                }
            case .ready, .paused, .finished:
                break
            }
        }
    }

    private func stopTimer() {
        timer?.invalidate()
        timer = nil

        UserDefaultsManager.resetTimer()
        Notifications.stopAllNotifications()
    }

    private func changePhase() {
        switch timerPhase {
        case .breakTime:
            self.timerPhase = .workTime
        case .workTime:
            self.timerPhase = .breakTime
        }

        UserDefaultsManager.setPhase(phase: timerPhase)
    }
}
