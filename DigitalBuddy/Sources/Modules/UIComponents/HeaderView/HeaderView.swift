//
//  HeaderView.swift
//  DigitalBuddy
//
//  Created by Gabriel Campos on 5/10/24.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subtitle: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 7) {
            Text(title)
                .font(.system(size: 25))
            Text(subtitle)
                .font(.system(size: 18))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    HeaderView(
        title: "Bienvenido!",
        subtitle: "Inicia Sesión en tu cuenta")
}
