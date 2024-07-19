//
//  TimerViewModel.swift
//  PomidoroApp
//
//  Created by Jan Kazubski on 19/07/2024.
//

import Foundation

class TimerViewModel: ObservableObject {
    @Published var secondsRemaining = TimeInterval(workTimeUserDefaults)

    @Published var timerMode: TimerMode = .Ready
    private var mode: ActualMode = .Work

    private var timer: Timer?

    func start() {
        resetSecondsRemaining()
        startTimer()
    }

    func pause() {
        timerMode = .Paused
        stopTimer()
    }

    func resume() {
        startTimer()
    }

    func reset() {
        timerMode = .Ready
        stopTimer()
        resetSecondsRemaining()
    }

    private func changeMode() {
        switch mode {
        case .Break:
            self.mode = .Work
        case .Work:
            self.mode = .Break
        }
    }

    private func startTimer() {
        timerMode = .Running
        Notifications.scheduleNotification(seconds: secondsRemaining, title: mode.getNotificationTitleString(), body: mode.getNotificationBodyString())

        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            switch self.timerMode {
            case .Running:
                if self.secondsRemaining > 1 {
                    self.secondsRemaining -= 1
                } else {
                    self.changeMode()
                    self.reset()
                }
            case .Ready, .Paused:
                break
            case .Finished:
                break
            }
        }
    }

    private func stopTimer() {
        Notifications.stopAllNotifications()

        timer?.invalidate()
        timer = nil
    }

    private func resetSecondsRemaining() {
        secondsRemaining =
            switch mode {
            case .Break:
                TimeInterval(breakTimeUserDefaults)
            case .Work:
                TimeInterval(workTimeUserDefaults)
            }
    }
}
