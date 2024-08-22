//
//  PomidoroAppApp.swift
//  PomidoroApp
//
//  Created by Jan Kazubski on 18/07/2024.
//

import SwiftUI

@main
struct PomidoroAppApp: App {
    @AppStorage(AppStorageKeys.SELECTED_THEME) private var selectedTheme: Theme = .systemDefault
    @AppStorage(AppStorageKeys.SELECTED_LANGUAGE) private var selectedLanguage: Language = .systemDefault

    init() {
        UserDefaultsManager.register()
    }

    var body: some Scene {
        WindowGroup {
            VStack {
                if UserDefaultsManager.timerMode == .running {
                    ContentView()
                } else {
                    SplashScreenView()
                }
            }
            .preferredColorScheme(selectedTheme.colorScheme)
            .environment(\.locale, selectedLanguage.locale)
        }
    }
}
