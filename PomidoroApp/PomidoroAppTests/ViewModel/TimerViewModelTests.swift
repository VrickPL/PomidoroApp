//
//  TimerViewModelTests.swift
//  PomidoroAppTests
//
//  Created by Jan Kazubski on 31/08/2024.
//

import Foundation
import Testing

@testable import PomidoroApp

@Suite(.serialized)
struct TimerViewModelTests {

    @Test
    func testDefaultTimer() {
        clear()

        let viewModel = TimerViewModel()

        #expect(viewModel.secondsRemaining == 1500)
        #expect(viewModel.timerPhase == TimerPhase.workTime)
        #expect(viewModel.timerMode == TimerMode.ready)
        #expect(viewModel.timerFinished == false)
        #expect(viewModel.baseTime == 1500)
        #expect(viewModel.timePassedPercentage == 0)

        clear(viewModel)
    }

    @Test
    func testModifiedTimer() {
        clear()

        UserDefaultsManager.setBreakTime(seconds: 3000)
        UserDefaultsManager.setPhase(phase: TimerPhase.breakTime)
        UserDefaultsManager.setTimerMode(timerMode: TimerMode.finished)

        let viewModel = TimerViewModel()

        #expect(viewModel.secondsRemaining == 3000)
        #expect(viewModel.timerPhase == TimerPhase.breakTime)
        #expect(viewModel.timerMode == TimerMode.finished)
        #expect(viewModel.timerFinished == false)
        #expect(viewModel.baseTime == 3000)
        #expect(viewModel.timePassedPercentage == 0)

        clear(viewModel)
    }

    @Test
    func testTimerPaused() {
        clear()

        UserDefaultsManager.setTimerMode(timerMode: TimerMode.paused)
        UserDefaultsManager.setSecondsLeftAfterPause(secondsLeft: 100)

        let viewModel = TimerViewModel()

        #expect(viewModel.secondsRemaining == 100)
        #expect(viewModel.timerPhase == TimerPhase.workTime)
        #expect(viewModel.timerMode == TimerMode.paused)
        #expect(viewModel.timerFinished == false)
        #expect(viewModel.baseTime == 1500)
        #expect(viewModel.timePassedPercentage == 0.93)

        clear(viewModel)
    }

    @Test
    func testTimerRunning() {
        clear()

        let startDate = Date.now.addingTimeInterval(-300)
        let secondsLeft: TimeInterval = 1200

        UserDefaultsManager.setDates(
            startDate: startDate, secondsLeft: secondsLeft)
        UserDefaultsManager.setTimerMode(timerMode: .running)

        let viewModel = TimerViewModel()

        #expect(viewModel.timerMode == TimerMode.running)
        #expect(viewModel.timerFinished == false)
        #expect(viewModel.baseTime == 1500)

        clear(viewModel)
    }

    @Test
    func testTimerFinished() {
        clear()

        let startDate = Date.now.addingTimeInterval(-1500)
        let secondsLeft: TimeInterval = 0

        UserDefaultsManager.setDates(
            startDate: startDate, secondsLeft: secondsLeft)
        UserDefaultsManager.setTimerMode(timerMode: .running)

        let viewModel = TimerViewModel()

        #expect(viewModel.timerMode == TimerMode.ready)
        #expect(viewModel.timerFinished == false)
        #expect(viewModel.timerPhase == TimerPhase.breakTime)

        clear(viewModel)
    }

    @Test
    func testStart() {
        clear()

        let viewModel = TimerViewModel()

        #expect(checkBeforeStart(viewModel))
        viewModel.start()
        #expect(checkAfterStart(viewModel))

        clear(viewModel)
    }

    @Test
    func testPause() {
        clear()

        let viewModel = TimerViewModel()

        #expect(checkBeforeStart(viewModel))
        viewModel.start()
        #expect(checkAfterStart(viewModel))

        viewModel.pause()

        #expect(viewModel.timerMode == TimerMode.paused)
        #expect(viewModel.secondsRemaining != 1500)
        #expect(UserDefaultsManager.endDate == nil)
        #expect(
            UserDefaultsManager.secondsLeftAfterPause
                == Int(viewModel.secondsRemaining)
        )

        clear(viewModel)
    }

    @Test
    func testResume() {
        clear()

        let viewModel = TimerViewModel()

        #expect(checkBeforeStart(viewModel))
        viewModel.start()
        #expect(checkAfterStart(viewModel))

        viewModel.pause()

        #expect(viewModel.timerMode == TimerMode.paused)
        #expect(viewModel.secondsRemaining != 1500)
        #expect(UserDefaultsManager.endDate == nil)
        #expect(
            UserDefaultsManager.secondsLeftAfterPause
                == Int(viewModel.secondsRemaining)
        )

        let endDateDuringPause = viewModel.secondsRemaining

        viewModel.resume()
        #expect(checkAfterStart(viewModel))
        #expect(viewModel.secondsRemaining == endDateDuringPause)

        clear(viewModel)
    }

    @Test
    func testReset() {
        clear()

        let viewModel = TimerViewModel()

        #expect(checkBeforeStart(viewModel))
        viewModel.start()
        #expect(checkAfterStart(viewModel))

        viewModel.reset()
        #expect(checkBeforeStart(viewModel))

        clear(viewModel)
    }

    @Test
    func testSkip() {
        clear()

        let viewModel = TimerViewModel()

        #expect(checkBeforeStart(viewModel))
        viewModel.start()
        #expect(checkAfterStart(viewModel))

        viewModel.skip()

        #expect(viewModel.timerPhase == TimerPhase.breakTime)
        #expect(viewModel.timerMode == TimerMode.ready)
        #expect(viewModel.secondsRemaining == 300)

        clear(viewModel)
    }

    private func clear(_ viewModel: TimerViewModel? = nil) {
        if let viewModel = viewModel {
            viewModel.reset()
        }

        UserDefaultsManager.clearAll()
    }

    private func checkBeforeStart(_ viewModel: TimerViewModel) -> Bool {
        return viewModel.timerPhase == TimerPhase.workTime
            && viewModel.timerMode == TimerMode.ready
            && viewModel.secondsRemaining == 1500
            && UserDefaultsManager.endDate == nil
    }

    private func checkAfterStart(_ viewModel: TimerViewModel) -> Bool {
        return viewModel.timerPhase == TimerPhase.workTime
            && viewModel.timerMode == TimerMode.running
            && viewModel.secondsRemaining != 1500
            && UserDefaultsManager.endDate != nil
    }
}
