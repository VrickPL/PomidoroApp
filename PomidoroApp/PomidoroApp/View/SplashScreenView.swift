//
//  SplashScreenView.swift
//  PomidoroApp
//
//  Created by Jan Kazubski on 02/08/2024.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5

    var body: some View {
        if isActive {
            ContentView()
        } else {
            ZStack {
                Color("BackgroundColor")
                    .ignoresSafeArea()
                VStack {
                    VStack {
                        Image("AppIconBackgroundless")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200, height: 200)
                            .padding()
                            .padding()
                            .background(Color("SplashScreenBackground"))
                            .cornerRadius(360)
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.smooth) {
                            self.size = 0.9
                            self.opacity = 1.0
                        }
                    }
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        withAnimation {
                            self.isActive = true
                        }
                    }
                }
            }
            .overlay(
                Text("author")
                    .foregroundStyle(.gray),
                alignment: .bottom)
        }
    }
}

#Preview {
    SplashScreenView()
}
