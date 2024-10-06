//
//  AdaptiveForegroundStyleModifier.swift
//  DigitalBuddy
//
//  Created by Gabriel Campos on 6/10/24.
//

import SwiftUI

struct AdaptiveForegroundStyleModifier: ViewModifier {
    @Environment(\.colorScheme) var colorScheme
    
    var lightColor: Color
    var darkColor: Color

    func body(content: Content) -> some View {
        content
            .foregroundStyle(colorScheme == .dark ? darkColor : lightColor)
    }
}

extension View {
    func adaptiveForegroundStyle(
        lightColor: Color,
        darkColor: Color
    ) -> some View {
        self.modifier(AdaptiveForegroundStyleModifier(lightColor: lightColor, darkColor: darkColor))
    }
}

