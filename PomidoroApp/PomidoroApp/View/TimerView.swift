//
//  TimerView.swift
//  PomidoroApp
//
//  Created by Jan Kazubski on 19/07/2024.
//

import SwiftUI

struct TimerView: View {
    @ObservedObject private var viewModel = TimerViewModel()
    
    var body: some View {
        VStack {
            ZStack {
                Circle().foregroundColor(.red)
                
                Text(viewModel.secondsRemaining.formatted)
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
        }
    }
}

extension TimeInterval {
    var formatted: String {
        let hours = Int(self) / 3600
        let minutes = Int(self) % 3600 / 60
        let seconds = Int(self) % 60

        return if hours > 0 {
            String(format: "%2d:%02d:%02d", hours, minutes, seconds)
        } else {
            String(format: "%02d:%02d", minutes, seconds)
        }
    }
}

#Preview {
    TimerView()
}
