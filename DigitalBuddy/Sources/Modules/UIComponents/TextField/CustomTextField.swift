//
//  CustomTextField.swift
//  DigitalBuddy
//
//  Created by Gabriel Campos on 5/10/24.
//

import SwiftUI

struct CustomTextField: View {
    @Environment(\.colorScheme) private var colorScheme
    
    // MARK: - Bindings
    @Binding var text: String
    
    // MARK: - Properties
    let textTitle: String
    let placeHolder: String
    let isNumericOnly: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(textTitle)
            
            RoundedRectangle(cornerRadius: 5)
                .stroke(colorScheme == .dark ? .white : .gray, lineWidth: 1)
                .frame(height: 50)
                .overlay {
                    TextField(placeHolder, text: $text)
                        .padding(.leading, 7)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                        .keyboardType(isNumericOnly ? .numberPad : .default)
                }
        }
    
    }
}

#Preview {
    @State var text = ""
    let placeHolder = "Escribe tu nombre de usuario"
    let textTitle = "Nombre de usuario"
    return CustomTextField(text: $text, textTitle: textTitle, placeHolder: placeHolder, isNumericOnly: false)
}
