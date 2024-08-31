//
//  AppStorageKeysTests.swift
//  PomidoroAppTests
//
//  Created by Jan Kazubski on 31/08/2024.
//

import Testing

@testable import PomidoroApp

struct AppStorageKeysTests {
    
    @Test
    func testBasic() {
        #expect(AppStorageKeys.SELECTED_LANGUAGE == "selected_language")
        #expect(AppStorageKeys.SELECTED_THEME == "selected_theme")
        #expect(AppStorageKeys.WORK_TIME == "work_time")
        #expect(AppStorageKeys.BREAK_TIME == "break_time")
        #expect(AppStorageKeys.HAPTIC == "haptic_enabled")
    }
}
