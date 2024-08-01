//
//  SettingsView.swift
//  PomidoroApp
//
//  Created by Jan Kazubski on 01/08/2024.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage(AppStorageKeys.SELECTED_LANGUAGE) private var selectedLanguage:
        Language = Language.systemDefault
    @AppStorage(AppStorageKeys.SELECTED_THEME) private var selectedTheme:
        Theme = Theme.systemDefault
    @AppStorage(AppStorageKeys.WORK_TIME) private var workTime: Int =
        UserDefaultsManager.defaultWorkTime
    @AppStorage(AppStorageKeys.BREAK_TIME) private var breakTime: Int =
        UserDefaultsManager.defaultBreakTime

    @State private var workTimeEnabled = false
    @State private var breakTimeEnabled = false

    var body: some View {
        NavigationView {
            Form {
                appSection

                generalSection

                authorSection
            }
        }
        .environment(\.locale, selectedLanguage.locale)
        .preferredColorScheme(selectedTheme.colorScheme)
    }

    private var appSection: some View {
        Section {
            workTimeView

            breakTimeView
        }
    }

    private var workTimeView: some View {
        VStack {
            HStack {
                HStack {
                    Text("work_length_time")
                    Image(systemName: "chevron.up")
                        .rotationEffect(
                            workTimeEnabled ? .degrees(180) : .degrees(0)
                        )
                        .animation(.bouncy, value: workTimeEnabled)
                }.foregroundStyle(.blue)

                Spacer()

                Text(TimeCalculator(workTime).format())
                    .foregroundStyle(Color("Opposed"))
            }.onTapGesture {
                workTimeEnabled.toggle()

                if breakTimeEnabled {
                    breakTimeEnabled.toggle()
                }
            }

            if workTimeEnabled {
                TimePickerView($workTime)
            }
        }
    }

    private var breakTimeView: some View {
        VStack {
            HStack {
                HStack {
                    Text("break_length_time")
                    Image(systemName: "chevron.up")
                        .rotationEffect(
                            breakTimeEnabled ? .degrees(180) : .degrees(0)
                        )
                        .animation(.bouncy, value: breakTimeEnabled)
                }.foregroundStyle(.blue)

                Spacer()

                Text(TimeCalculator(breakTime).format())
                    .foregroundStyle(Color("Opposed"))

            }.onTapGesture {
                breakTimeEnabled.toggle()

                if workTimeEnabled {
                    workTimeEnabled.toggle()
                }
            }

            if breakTimeEnabled {
                TimePickerView($breakTime)
            }
        }
    }

    private var generalSection: some View {
        Section(header: Text("general")) {
            Picker("language", selection: $selectedLanguage) {
                ForEach(Language.allCases, id: \.rawValue) { language in
                    Text(LocalizedStringKey(language.rawValue)).tag(language)
                }
            }
            Picker("theme", selection: $selectedTheme) {
                ForEach(Theme.allCases, id: \.rawValue) { theme in
                    Text(LocalizedStringKey(theme.rawValue)).tag(theme)
                }
            }
        }
    }

    private var authorSection: some View {
        Section(
            header: HStack {
                Image(systemName: "link")
                Text("app_author")
                Text("-  Jan Kazubski")
            }
        ) {
            LinkButton(url: "https://github.com/VrickPL", title: "GitHub")
            LinkButton(
                url: "https://linkedin.com/in/jan-kazubski", title: "LinkedIn")
        }
    }

    private struct LinkButton: View {
        let url: String
        let title: String

        var body: some View {
            Button(action: openURL) {
                Text(title)
            }
        }

        private func openURL() {
            guard let url = URL(string: url) else { return }
            UIApplication.shared.open(url)
        }
    }
}

#Preview {
    SettingsView()
}
