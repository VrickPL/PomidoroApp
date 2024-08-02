//
//  ContentView.swift
//  PomidoroApp
//
//  Created by Jan Kazubski on 18/07/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var showNotificationsWarning = false
    @Environment(\.scenePhase) var scenePhase

    var body: some View {
        NavigationView {
            VStack {
                Spacer()

                TimerView()

                Spacer()
                if showNotificationsWarning {
                    HStack(spacing: 0) {
                        Button(action: {
                            openSettings()
                        }) {
                            Text("notifications_disabled_click_here")
                                .underline()
                                .foregroundColor(.blue)
                                + Text("notifications_disabled_text")
                                .foregroundColor(.black)
                        }
                    }
                    .fixedSize(horizontal: true, vertical: true)
                }
            }
            .padding()
            .background(Color("BackgroundColor")).navigationBarTitleDisplayMode(
                .inline
            )
            .navigationBarItems(
                trailing: NavigationLink(destination: SettingsView()) {
                    Image(systemName: "gearshape.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 30)
                }
            )
            .onChange(of: scenePhase) {
                if scenePhase == .active {
                    Notifications.checkAuthorization { authorized in
                        showNotificationsWarning = !authorized
                    }
                }
            }
        }
    }

    private func openSettings() {
        DispatchQueue.main.sync {
            UIApplication.shared.open(
                URL(string: UIApplication.openSettingsURLString)!, options: [:],
                completionHandler: nil)
        }
    }
}

#Preview {
    ContentView()
}
