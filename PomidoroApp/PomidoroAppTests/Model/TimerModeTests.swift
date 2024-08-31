//
//  TimerModeTests.swift
//  PomidoroAppTests
//
//  Created by Jan Kazubski on 31/08/2024.
//

import Testing

@testable import PomidoroApp

struct TimerModeTests {
    
    @Test
    func testAllCasesAreCovered() {
        let expectedCases: [TimerMode] = [.ready, .running, .paused, .finished]

        #expect(TimerMode.allCases == expectedCases)
    }
    
    @Test
    func testRawValues() {
        #expect(TimerMode.ready.rawValue == "ready")
        #expect(TimerMode.running.rawValue == "running")
        #expect(TimerMode.paused.rawValue == "paused")
        #expect(TimerMode.finished.rawValue == "finished")
    }
    
    @Test
    func testFromString1() {
        #expect(TimerMode.fromString("ready") == TimerMode.ready)
    }
    
    @Test
    func testFromString2() {
        #expect(TimerMode.fromString("running") == TimerMode.running)
    }
    
    @Test
    func testFromString3() {
        #expect(TimerMode.fromString("paused") == TimerMode.paused)
    }
    
    @Test
    func testFromString4() {
        #expect(TimerMode.fromString("finished") == TimerMode.finished)
    }
    
    @Test
    func testFromString5() {
        #expect(TimerMode.fromString(nil) == nil)
    }
    
    @Test
    func testFromString6() {
        #expect(TimerMode.fromString("") == nil)
    }
    
    @Test
    func testFromString7() {
        #expect(TimerMode.fromString("aaa") == nil)
    }
}
