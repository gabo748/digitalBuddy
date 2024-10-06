//
//  CustomBackButton.swift
//  DigitalBuddy
//
//  Created by Gabriel Campos on 6/10/24.
//

import SwiftUI

struct ToolbarBackButtonModifier: ViewModifier {
    @Environment(\.colorScheme) private var colorScheme
    
    var backAction: (() -> Void)
    
    init(backAction: @escaping (() -> Void)) {
        self.backAction = backAction
    }
    
    private var backwardIcon: String = "arrow.backward"
    
    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        backAction()
                    }, label: {
                        Image(systemName: backwardIcon)
                            .resizable()
                            .frame(width: 18, height: 18)
                            .foregroundStyle(colorScheme == .dark ? .white : .black)
                    })
                }
            }
    }
}

extension View {
    func customBackButtonToolbar(
        backAction: @escaping (() -> Void)
    ) -> some View {
        self.modifier(ToolbarBackButtonModifier(backAction: backAction))
    }
}
