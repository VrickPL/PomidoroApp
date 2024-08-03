//
//  PomidoroAppApp.swift
//  PomidoroApp
//
//  Created by Jan Kazubski on 18/07/2024.
//

import SwiftUI

@main
struct PomidoroAppApp: App {
    init() {
        UserDefaultsManager.register()
    }

    var body: some Scene {
        WindowGroup {
            if UserDefaultsManager.timerMode == .running {
                ContentView()
            } else {
                SplashScreenView()
            }
        }
    }
}
