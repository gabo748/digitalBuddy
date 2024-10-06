//
//  ConfirmationAppButtonStyle.swift
//  DigitalBuddy
//
//  Created by Gabriel Campos on 6/10/24.
//

import SwiftUI

struct ConfirmationAppButtonStyle: ButtonStyle {
    @Environment(\.colorScheme) private var colorScheme
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundStyle(colorScheme == .dark ? Color(hex: "182e60") : .white)
            .frame(minWidth: 220, minHeight: 40)
            .background(colorScheme == .dark ? Color(hex: "b2c5ff") : Color(hex: "495d92"))
            .cornerRadius(7)
    }
}

#Preview {
    Button(action: {
        
    }, label: {
        Text("sesión")
    })
    .buttonStyle(ConfirmationAppButtonStyle())
}

