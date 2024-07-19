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

    func skip() {
        stopTimer()
        changeMode()
        resetSecondsRemaining()
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
