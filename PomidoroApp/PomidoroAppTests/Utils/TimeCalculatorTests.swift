//
//  TimeCalculatorTests.swift
//  PomidoroAppTests
//
//  Created by Jan Kazubski on 31/08/2024.
//

import Testing

@testable import PomidoroApp

struct TimeCalculatorTests {

    @Test
    func testBasic1() {
        let timeCalculator = TimeCalculator(12)

        #expect(timeCalculator.time == 12)
        #expect(timeCalculator.seconds == 12)
        #expect(timeCalculator.minutes == 0)
        #expect(timeCalculator.hours == 0)
    }
    
    @Test
    func testBasic2() {
        let timeCalculator = TimeCalculator(0)
        
        #expect(timeCalculator.time == 0)
        #expect(timeCalculator.seconds == 0)
        #expect(timeCalculator.minutes == 0)
        #expect(timeCalculator.hours == 0)
    }
    
    @Test
    func testBasic3() {
        let timeCalculator = TimeCalculator(360)
        
        #expect(timeCalculator.time == 360)
        #expect(timeCalculator.seconds == 0)
        #expect(timeCalculator.minutes == 6)
        #expect(timeCalculator.hours == 0)
    }
    
    @Test
    func testBasic4() {
        let timeCalculator = TimeCalculator(3600)
        
        #expect(timeCalculator.time == 3600)
        #expect(timeCalculator.seconds == 0)
        #expect(timeCalculator.minutes == 0)
        #expect(timeCalculator.hours == 1)
    }
    
    @Test
    func testBasic5() {
        let timeCalculator = TimeCalculator(3599)
        
        #expect(timeCalculator.time == 3599)
        #expect(timeCalculator.seconds == 59)
        #expect(timeCalculator.minutes == 59)
        #expect(timeCalculator.hours == 0)
    }
    
    @Test
    func testBasic6() {
        let timeCalculator = TimeCalculator(1000)
        
        #expect(timeCalculator.time == 1000)
        #expect(timeCalculator.seconds == 40)
        #expect(timeCalculator.minutes == 16)
        #expect(timeCalculator.hours == 0)
    }
    
    @Test
    func testBasic7() {
        let timeCalculator = TimeCalculator(10000)
        
        #expect(timeCalculator.time == 10000)
        #expect(timeCalculator.seconds == 40)
        #expect(timeCalculator.minutes == 46)
        #expect(timeCalculator.hours == 2)
    }
    
    @Test
    func testBasic8() {
        let timeCalculator = TimeCalculator(hours: 0, minutes: 16, seconds: 40)
        
        #expect(timeCalculator.time == 1000)
        #expect(timeCalculator.seconds == 40)
        #expect(timeCalculator.minutes == 16)
        #expect(timeCalculator.hours == 0)
    }
    
    @Test
    func testBasic9() {
        let timeCalculator = TimeCalculator(hours: 2, minutes: 46, seconds: 40)
        
        #expect(timeCalculator.time == 10000)
        #expect(timeCalculator.seconds == 40)
        #expect(timeCalculator.minutes == 46)
        #expect(timeCalculator.hours == 2)
    }
    
    @Test
    func testFormat1() {
        let timeCalculator = TimeCalculator(12)
        
        #expect(timeCalculator.format() == "00:12")
    }
    
    @Test
    func testFormat2() {
        let timeCalculator = TimeCalculator(0)
        
        #expect(timeCalculator.format() == "00:00")
    }
    
    @Test
    func testFormat3() {
        let timeCalculator = TimeCalculator(360)
        
        #expect(timeCalculator.format() == "06:00")
    }
    
    @Test
    func testFormat4() {
        let timeCalculator = TimeCalculator(3600)
        
        #expect(timeCalculator.format() == " 1:00:00")
    }
    
    @Test
    func testFormat5() {
        let timeCalculator = TimeCalculator(3599)
        
        #expect(timeCalculator.format() == "59:59")
    }
    
    @Test
    func testFormat6() {
        let timeCalculator = TimeCalculator(1000)
        
        #expect(timeCalculator.format() == "16:40")
    }
    
    @Test
    func testFormat7() {
        let timeCalculator = TimeCalculator(10000)
        
        #expect(timeCalculator.format() == " 2:46:40")
    }
}
