//
//  LanguageTests.swift
//  PomidoroAppTests
//
//  Created by Jan Kazubski on 31/08/2024.
//

import Foundation
import Testing

@testable import PomidoroApp

struct LanguageTests {

    @Test
    func testAllCasesAreCovered() {
        let expectedCases: [Language] = [.systemDefault, .english, .polish]

        #expect(Language.allCases == expectedCases)
    }

    @Test
    func testDefaultLocale() {
        let systemDefaultLanguage = Language.systemDefault
        let currentLocale = Locale.current

        #expect(systemDefaultLanguage.locale == currentLocale)
    }

    @Test
    func testEnglishLocale() {
        let englishLanguage = Language.english
        let englishLocale = Locale(identifier: "en")

        #expect(englishLanguage.locale == englishLocale)
    }

    @Test
    func testPolishLocale() {
        let polishLanguage = Language.polish
        let polishLocale = Locale(identifier: "pl")

        #expect(polishLanguage.locale == polishLocale)
    }
}
