//
//  UserDefaultsManager.swift
//  PomidoroApp
//
//  Created by Jan Kazubski on 19/07/2024.
//

import Foundation

func registerUserDefaults() {
    let userDefaults = UserDefaults.standard
    let defaultValues = [
        Keys.workTime: 10,
        Keys.breakTime: 5,
    ]
    userDefaults.register(defaults: defaultValues)
}

var workTimeUserDefaults = UserDefaults.standard.integer(forKey: Keys.workTime)
var breakTimeUserDefaults = UserDefaults.standard.integer(forKey: Keys.breakTime)
