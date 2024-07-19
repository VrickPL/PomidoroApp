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
            
            switch viewModel.timerMode {
            case .Ready, .Finished:
                Button {
                    viewModel.start()
                } label: {
                    Text("start")
                        .padding()
                        .background(.white)
                        .cornerRadius(10)
                }
            case .Running:
                Button {
                    viewModel.pause()
                } label: {
                    Text("stop")
                        .padding()
                        .background(.white)
                        .cornerRadius(10)
                }
            case .Paused:
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
