//
//  CustomButton.swift
//  PomidoroApp
//
//  Created by Jan Kazubski on 21/08/2024.
//

import SwiftUI

struct CustomButton: View {
    @State var onAction: () -> Void
    @State var text: String

    var body: some View {
        Button {
            onAction()
        } label: {
            Text(LocalizedStringKey(text))
                .font(.system(size: 24))
                .foregroundColor(Color("BackgroundColor"))
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color("ForegroundColor"))
                .cornerRadius(15)
        }
    }
}
