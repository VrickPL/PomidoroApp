//
//  TimerView.swift
//  PomidoroApp
//
//  Created by Jan Kazubski on 19/07/2024.
//

import SwiftUI

struct TimerView: View {
    @AppStorage(AppStorageKeys.WORK_TIME) private var workTime: Int =
        UserDefaultsManager.defaultWorkTime
    @AppStorage(AppStorageKeys.BREAK_TIME) private var breakTime: Int =
        UserDefaultsManager.defaultBreakTime
    @AppStorage(AppStorageKeys.HAPTIC) private var hapticEnabled: Bool = true

    @State private var viewModel = TimerViewModel()
    @State private var shouldTriggerSuccess = true
    @State private var isLandscape: Bool = false

    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height

            VStack {
                if !isLandscape {
                    VStack {
                        Spacer()
                        CurrentTomatoView(timePassed: viewModel.timePassedPercentage)
                        Spacer()
                    }
                    .frame(
                        width: width,
                        height: height * 0.5
                    )
                }

                VStack {
                    Text(TimeCalculator(viewModel.secondsRemaining).format())
                        .bold()
                        .font(.system(size: isLandscape ? 150 : 90))
                        .foregroundColor(Color("ForegroundColor"))

                    Text(LocalizedStringKey(viewModel.timerPhase.rawValue))
                        .foregroundColor(Color("ModeNameColor"))
                        .bold()

                    Spacer()

                    switch viewModel.timerMode {
                    case .ready, .finished:
                        CustomButton(
                            onAction: {
                                viewModel.start()
                                triggerMediumHapticFeedback()

                                shouldTriggerSuccess = true
                            },
                            text: "start"
                        )
                        .frame(maxWidth: .infinity)
                        .padding()
                    case .running:
                        HStack {
                            CustomButton(
                                onAction: {
                                    viewModel.pause()
                                    triggerMediumHapticFeedback()
                                },
                                text: "stop"
                            )
                            .frame(width: .infinity)
                            .padding()

                            CustomButton(
                                onAction: {
                                    viewModel.skip()
                                    triggerMediumHapticFeedback()
                                },
                                text: "skip"
                            )
                            .frame(maxWidth: .infinity)
                            .padding()
                        }
                    case .paused:
                        HStack {
                            CustomButton(
                                onAction: {
                                    viewModel.resume()
                                    triggerMediumHapticFeedback()

                                    shouldTriggerSuccess = true
                                },
                                text: "resume"
                            )
                            .padding()

                            CustomButton(
                                onAction: {
                                    viewModel.reset()
                                    triggerMediumHapticFeedback()
                                },
                                text: "reset"
                            )
                            .padding()
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
                .frame(
                    width: width,
                    height: isLandscape ? height : height * 0.5
                )
                .onAppear {
                    isLandscape = width > height
                }
                .onChange(of: geometry.size) { _, newSize in
                    self.isLandscape = newSize.width > newSize.height
                }
            }
        }.onChange(of: workTime) {
            if viewModel.timerPhase == .workTime {
                viewModel.reset()
            }
        }.onChange(of: breakTime) {
            if viewModel.timerPhase == .breakTime {
                viewModel.reset()
            }
        }.onReceive(
            NotificationCenter.default.publisher(
                for: UIApplication.didBecomeActiveNotification)
        ) { _ in
            viewModel = TimerViewModel()

            guard let endDate = UserDefaultsManager.endDate else { return }
            if .now > endDate {
                shouldTriggerSuccess = false
            }
        }.onChange(of: viewModel.timerFinished) {
            if viewModel.timerFinished {
                triggerSuccessHapticFeedback()
                viewModel.timerFinished = false
            }
        }
    }

    private struct CurrentTomatoView: View {
        var timePassed: Double

        @State private var currentTomato: Tomato = Tomato.plant

        var body: some View {
            VStack {
                switch currentTomato {
                case .tomato:
                    Image(currentTomato.rawValue)
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(0.8)
                case .greenTomato:
                    Image(currentTomato.rawValue)
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(0.6)
                case .biggerPlant:
                    Image(currentTomato.rawValue)
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(0.7)
                case .plant:
                    Image(currentTomato.rawValue)
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(0.5)
                }
            }
            .animation(.easeInOut, value: currentTomato)
            .onAppear {
                updateImage()
            }
            .onChange(of: timePassed) {
                updateImage()
            }
        }

        private func updateImage() {
            withAnimation {
                if timePassed >= 0.75 {
                    currentTomato = Tomato.tomato
                } else if timePassed >= 0.5 {
                    currentTomato = Tomato.greenTomato
                } else if timePassed >= 0.25 {
                    currentTomato = Tomato.biggerPlant
                } else {
                    currentTomato = Tomato.plant
                }
            }
        }

        private enum Tomato: String {
            case tomato = "Tomato"
            case greenTomato = "GreenTomato"
            case biggerPlant = "BiggerPlant"
            case plant = "Plant"
        }
    }

    private func triggerMediumHapticFeedback() {
        if hapticEnabled {
            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
        }
    }

    private func triggerSuccessHapticFeedback() {
        if hapticEnabled && shouldTriggerSuccess {
            shouldTriggerSuccess = false
            UINotificationFeedbackGenerator().notificationOccurred(.success)
        }
    }
}

#Preview {
    TimerView()
}
