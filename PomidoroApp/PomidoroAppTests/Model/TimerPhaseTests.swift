//
//  TimerPhaseTests.swift
//  PomidoroAppTests
//
//  Created by Jan Kazubski on 31/08/2024.
//

import Testing

@testable import PomidoroApp

struct TimerPhaseTests {
    
    @Test
    func testAllCasesAreCovered() {
        let expectedCases: [TimerPhase] = [.breakTime, .workTime]
        
        #expect(TimerPhase.allCases == expectedCases)
    }
    
    @Test
    func testRawValues() {
        #expect(TimerPhase.workTime.rawValue == "workTime")
        #expect(TimerPhase.breakTime.rawValue == "breakTime")
    }
    
    @Test
    func testFromString1() {
        #expect(TimerPhase.fromString("workTime") == TimerPhase.workTime)
    }
    
    @Test
    func testFromString2() {
        #expect(TimerPhase.fromString("breakTime") == TimerPhase.breakTime)
    }
    
    @Test
    func testFromString5() {
        #expect(TimerPhase.fromString(nil) == nil)
    }
    
    @Test
    func testFromString6() {
        #expect(TimerPhase.fromString("") == nil)
    }
    
    @Test
    func testFromString7() {
        #expect(TimerPhase.fromString("aaa") == nil)
    }
    
    @Test
    func testNotificationTitleStringWorkTime() {
        #expect(TimerPhase.workTime.getNotificationTitleString() == "notification_title_work_done")
    }
    
    @Test
    func testNotificationTitleStringBreakTime() {
        #expect(TimerPhase.breakTime.getNotificationTitleString() == "notification_title_break_done")
    }
    
    @Test
    func testNotificationBodyStringWorkTime() {
        #expect(TimerPhase.workTime.getNotificationBodyString() == "notification_body_work_done")
    }
    
    @Test
    func testNotificationBodyStringBreakTime() {
        #expect(TimerPhase.breakTime.getNotificationBodyString() == "notification_body_break_done")
    }
}
