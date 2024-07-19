//
//  ContentView.swift
//  PomidoroApp
//
//  Created by Jan Kazubski on 18/07/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color("BackgroundColor")
            
            TimerView()
        }.ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
