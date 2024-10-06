//
//  EmailVerificationView.swift
//  DigitalBuddy
//
//  Created by Gabriel Campos on 6/10/24.
//

import SwiftUI

struct EmailVerificationView: View {
    @Environment(\.colorScheme) private var colorScheme
    
    @ObservedObject private var viewModel: SignUpViewModel
    @ObservedObject private var coordinator: SignUpCoordinator
    
    private var closeIcon = "xmark"
    
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
                navigationHeaderIcon
                
                header
                
                content
                
                Spacer()
                
                footer
            }
            .frame(height: safeAreaHeight)
            .padding(.horizontal, 20)
        }
        .scrollBounceBehavior(.basedOnSize, axes: [.vertical])
    }
    
    var navigationHeaderIcon: some View {
        VStack {
            Button(action: {
                coordinator.parentCoordinator?.dismissCover()
            }, label: {
                Image(systemName: closeIcon)
                    .resizable()
                    .frame(width: 18, height: 18)
                    .foregroundStyle(colorScheme == .dark ? .white : .black)
            })
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    var header: some View {
        HeaderView(
            title: EmailVerificationConstants.headerWelcomeLabel.rawValue,
            subtitle: EmailVerificationConstants.headerRegisterAccountLabel.rawValue
        )
    }
    
    var content: some View {
        VStack(spacing: 25) {
            Image("LogoAppIcon")
                .resizable()
                .frame(width: 120, height: 120)
            
            CustomTextField(
                text: $viewModel.email,
                textTitle: EmailVerificationConstants.emailLabel.rawValue,
                placeHolder: EmailVerificationConstants.emailPlaceHolderLabel.rawValue,
                isNumericOnly: false
            )
            
            Button(action: {
                coordinator.push(page: .codeVerification)
            }, label: {
                Text(EmailVerificationConstants.nextButtonLabel.rawValue)
            })
            .buttonStyle(CustomButtonStyle())
            
        }
        .padding(.top, 50)
    }
    
    var footer: some View {
        VStack {
            HStack {
                Text(EmailVerificationConstants.footerAccountLabel.rawValue)
                Button {
                    coordinator.parentCoordinator?.dismissCover()
                } label: {
                    Text(EmailVerificationConstants.footerSignInLabel.rawValue)
                }
            }
        }
    }
}

#Preview {
    EmailVerificationView(viewModel: .init(), coordinator: .init(parentCoordinator: nil))
}
