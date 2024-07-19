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
        registerUserDefaults()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
