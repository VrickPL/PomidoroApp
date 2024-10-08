//
//  Theme.swift
//  PomidoroApp
//
//  Created by Jan Kazubski on 01/08/2024.
//

import Foundation
import SwiftUI

enum Theme: String, CaseIterable {
    case systemDefault = "auto"
    case light = "light"
    case dark = "dark"

    var colorScheme: ColorScheme? {
        return switch self {
        case .systemDefault:
            nil
        case .light:
            .light
        case .dark:
            .dark
        }
    }
}
