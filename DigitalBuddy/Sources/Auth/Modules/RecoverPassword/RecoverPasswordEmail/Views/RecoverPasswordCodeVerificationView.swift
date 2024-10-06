//
//  RecoverPasswordCodeVerification.swift
//  DigitalBuddy
//
//  Created by Gabriel Campos on 6/10/24.
//

import SwiftUI

struct RecoverPasswordCodeVerificationView: View {
    @ObservedObject private var viewModel: RecoverPasswordViewModel
    @ObservedObject private var coordinator: RecoverPasswordCoordinator
    
    init(
        viewModel: RecoverPasswordViewModel,
        coordinator: RecoverPasswordCoordinator
    ) {
        self._viewModel = ObservedObject(wrappedValue: viewModel)
        self._coordinator = ObservedObject(wrappedValue: coordinator)
    }
    
    var body: some View {
        ScrollView {
            VStack {
                header
                
                content
                
                Spacer()
            }
            .frame(height: safeAreaHeight)
            .padding(.horizontal, 20)
        }
        .scrollBounceBehavior(.basedOnSize, axes: [.vertical])
        .customBackButtonToolbar(backAction: coordinator.pop)
    }
    
    var header: some View {
        HeaderView(
            title: RecoverPasswordEmailConstants.headerRecoverPasswordLabel.rawValue,
            subtitle: ""
        )
    }
    
    var content: some View {
        VStack(spacing: 25) {
            
            VStack(spacing: 10) {
                Image("LogoAppIcon")
                    .resizable()
                    .frame(width: 120, height: 120)
                
                Text(CodeVerificationConstants.contentVerificationMessage.rawValue)
                    .multilineTextAlignment(.center)
            }
            
            CustomTextField(
                text: $viewModel.verificationCode,
                textTitle: CodeVerificationConstants.codeLabel.rawValue,
                placeHolder: CodeVerificationConstants.codePlaceHolderLabel.rawValue,
                isNumericOnly: true
            )
            
            Button(action: {
                coordinator.push(page: .resetPassword)
            }, label: {
                Text(CodeVerificationConstants.verificationButtonLabel.rawValue)
            })
            .buttonStyle(CustomButtonStyle())
            
        }
        .padding(.top, 50)
    }
    
}
