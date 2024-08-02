//
//  TimePicker.swift
//  PomidoroApp
//
//  Created by Jan Kazubski on 01/08/2024.
//

import SwiftUI

struct TimePickerView: View {
    @Binding var time: Int

    @State private var hours: Int
    @State private var minutes: Int
    @State private var seconds: Int

    init(_ time: Binding<Int>) {
        self._time = time

        let timeCalculator = TimeCalculator(time.wrappedValue)

        self.hours = timeCalculator.hours
        self.minutes = timeCalculator.minutes
        self.seconds = timeCalculator.seconds
    }

    private func updateTime() {
        let newTime = TimeCalculator(hours: hours, minutes: minutes, seconds: seconds).time

        if newTime < 1 {
            self.minutes = 1
        }
        time = TimeCalculator(hours: hours, minutes: minutes, seconds: seconds).time
    }
    
    private func calculateTime() -> Int {
        return TimeCalculator(hours: hours, minutes: minutes, seconds: seconds).time
            
    }

    var body: some View {
        HStack {
            TimePicker(number: $hours, time: .hours)
            TimePicker(number: $minutes, time: .minutes)
            TimePicker(number: $seconds, time: .seconds)
        }.onChange(of: hours) {
            updateTime()
        }.onChange(of: minutes) {
            updateTime()
        }.onChange(of: seconds) {
            updateTime()
        }
    }

    private struct TimePicker: View {
        @Binding var number: Int
        var time: Time

        var body: some View {
            HStack(spacing: -5) {
                Picker("", selection: $number) {
                    ForEach(0...time.maxValue, id: \.self) { value in
                        Text("\(value)")
                    }
                }.pickerStyle(.wheel)
                    .labelsHidden()
                Text(time.rawValue)
            }
        }
    }

    private enum Time: String {
        case hours = "h"
        case minutes = "m"
        case seconds = "s"

        var maxValue: Int {
            switch self {
            case .hours: 9
            case .minutes: 59
            case .seconds: 59
            }
        }
    }
}

#Preview {
    TimePickerView(.constant(3500))
}
