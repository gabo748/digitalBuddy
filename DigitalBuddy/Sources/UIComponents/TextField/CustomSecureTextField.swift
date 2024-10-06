//
//  CustomSecureTextField.swift
//  DigitalBuddy
//
//  Created by Gabriel Campos on 5/10/24.
//

import SwiftUI

struct CustomSecureTextField: View {
    @Environment(\.colorScheme) private var colorScheme
    
    // MARK: - Bindings
    @Binding var password: String
    @State var isShowingPassword: Bool = false
    
    // MARK: - Properties
    private let eyeSlashIcon = "eye.slash"
    private let eyeIcon = "eye"
    
    let textTitle: String
    let placeHolder: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(textTitle)
            
            RoundedRectangle(cornerRadius: 5)
                .stroke(colorScheme == .dark ? .white : .gray, lineWidth: 1)
                .frame(height: 50)
                .overlay {
                    HStack {
                        Group {
                            if isShowingPassword {
                                TextField(placeHolder, text: $password)
                            }else {
                                SecureField(placeHolder, text: $password)
                            }
                        }
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding(.leading, 7)
                        
                        Spacer()
                        
                        eyeIconButton
                            .foregroundStyle(.gray)
                            .padding(.trailing, 7)
                        
                    }
                }
        }
    }
    
    var eyeIconButton: some View {
        Button(action: {
            isShowingPassword.toggle()
        }, label: {
            guard isShowingPassword else {
                return Image(systemName: eyeSlashIcon)
            }
            return Image(systemName: eyeIcon)
        })
    }
}

#Preview {
    @State var text = ""
    let placeHolder = "Escribe tu contraseña"
    let textTitle = "Contraseña"
    return CustomSecureTextField(password: $text, textTitle: textTitle, placeHolder: placeHolder)
}
