//
//  ThemeTests.swift
//  PomidoroAppTests
//
//  Created by Jan Kazubski on 31/08/2024.
//

import SwiftUI
import Testing

@testable import PomidoroApp

struct ThemeTests {

    @Test
    func testAllCasesAreCovered() {
        let expectedCases: [Theme] = [.systemDefault, .light, .dark]

        #expect(Theme.allCases == expectedCases)
    }
    
    @Test
    func testDefaultColorScheme() {
        let theme = Theme.systemDefault
        let expectedColorScheme: ColorScheme? = nil
        
        #expect(theme.colorScheme == expectedColorScheme)
    }
    
    @Test
    func testLightColorScheme() {
        let theme = Theme.light
        let expectedColorScheme: ColorScheme? = .light
        
        #expect(theme.colorScheme == expectedColorScheme)
    }
    
    @Test
    func testDarkColorScheme() {
        let theme = Theme.dark
        let expectedColorScheme: ColorScheme? = .dark
        
        #expect(theme.colorScheme == expectedColorScheme)
    }
}
