//
//  DefaultAppButtonStyle.swift
//  DigitalBuddy
//
//  Created by Gabriel Campos on 5/10/24.
//

import SwiftUI

struct CustomButtonStyle: ButtonStyle {
    @Environment(\.colorScheme) private var colorScheme
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundStyle(colorScheme == .dark ? .white : .black)
            .frame(minWidth: 220, minHeight: 40)
            .background(Color(UIColor.lightGray).opacity(0.5))
            .overlay {
                RoundedRectangle(cornerRadius: 7)
                    .stroke(colorScheme == .dark ? .white : .black, lineWidth: 1.5)
            }
            .cornerRadius(7)
    }
}

#Preview {
    Button(action: {
        
    }, label: {
        Text("Iniciar sesión")
    })
    .buttonStyle(CustomButtonStyle())
}
