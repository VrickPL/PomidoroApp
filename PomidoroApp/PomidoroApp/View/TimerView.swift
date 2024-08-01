//
//  TimerView.swift
//  PomidoroApp
//
//  Created by Jan Kazubski on 19/07/2024.
//

import SwiftUI

struct TimerView: View {
    @AppStorage(AppStorageKeys.WORK_TIME) private var workTime: Int = UserDefaultsManager.defaultWorkTime
    @AppStorage(AppStorageKeys.BREAK_TIME) private var breakTime: Int = UserDefaultsManager.defaultBreakTime
    
    @State private var viewModel = TimerViewModel()

    var body: some View {
        VStack {
            ZStack {
                Circle().foregroundColor(.red)

                Text(TimeCalculator(viewModel.secondsRemaining).format())
                    .bold()
                    .font(.system(size: 50))
                    .foregroundColor(.white)
            }.padding()

            Text(viewModel.mode.rawValue)

            switch viewModel.timerMode {
            case .ready, .finished:
                Button {
                    viewModel.start()
                } label: {
                    Text("start")
                        .padding()
                        .background(.white)
                        .cornerRadius(10)
                }
            case .running:
                Button {
                    viewModel.pause()
                } label: {
                    Text("stop")
                        .padding()
                        .background(.white)
                        .cornerRadius(10)
                }

                Button {
                    viewModel.skip()
                } label: {
                    Text("skip")
                        .padding()
                        .background(.white)
                        .cornerRadius(10)
                }
            case .paused:
                Button {
                    viewModel.resume()
                } label: {
                    Text("resume")
                        .padding()
                        .background(.white)
                        .cornerRadius(10)
                }

                Button {
                    viewModel.reset()
                } label: {
                    Text("reset")
                        .padding()
                        .background(.white)
                        .cornerRadius(10)
                }
            }
        }.onChange(of: workTime) {
            if viewModel.mode == .workTime {
                viewModel.reset()
            }
        }.onChange(of: breakTime) {
            if viewModel.mode == .breakTime {
                viewModel.reset()
            }
        }
    }
}

#Preview {
    TimerView()
}
