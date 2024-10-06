//
//  CodeVerificationView.swift
//  DigitalBuddy
//
//  Created by Gabriel Campos on 6/10/24.
//

import SwiftUI

struct CodeVerificationView: View {
    @ObservedObject private var viewModel: SignUpViewModel
    @ObservedObject private var coordinator: SignUpCoordinator
    
    init(
        viewModel: SignUpViewModel,
        coordinator: SignUpCoordinator
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
                
                footer
                    .padding(.bottom, 30)
            }
            .frame(height: safeAreaHeight)
            .padding(.horizontal, 20)
        }
        .scrollBounceBehavior(.basedOnSize, axes: [.vertical])
        .customBackButtonToolbar(backAction: coordinator.pop)
    }
    
    var header: some View {
        HeaderView(
            title: CodeVerificationConstants.headerWelcomeLabel.rawValue,
            subtitle: CodeVerificationConstants.headerEmailVerificationLabel.rawValue
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
                coordinator.push(page: .userInformationForm)
            }, label: {
                Text(CodeVerificationConstants.verificationButtonLabel.rawValue)
            })
            .buttonStyle(CustomButtonStyle())
            
        }
        .padding(.top, 50)
    }
    
    var footer: some View {
        VStack {
            HStack {
                Text(CodeVerificationConstants.footerAccountLabel.rawValue)
                Button {
                    coordinator.parentCoordinator?.dismissCover()
                } label: {
                    Text(CodeVerificationConstants.footerSignInLabel.rawValue)
                }
            }
        }
    }
}

#Preview {
    CodeVerificationView(viewModel: .init(), coordinator: .init(parentCoordinator: nil))
}
