//
//  RecoverPasswordEmailView.swift
//  DigitalBuddy
//
//  Created by Gabriel Campos on 6/10/24.
//

import SwiftUI

struct RecoverPasswordEmailView: View {
    @Environment(\.colorScheme) private var colorScheme
    
    @ObservedObject private var viewModel: RecoverPasswordViewModel
    @ObservedObject private var coordinator: RecoverPasswordCoordinator
    
    private var closeIcon = "xmark"
    
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
                navigationHeaderIcon
                
                header
                
                content
                
                Spacer()
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
            title: RecoverPasswordEmailConstants.headerRecoverPasswordLabel.rawValue,
            subtitle: RecoverPasswordEmailConstants.headerRecoverPasswordSubtitle.rawValue
        )
    }
    var content: some View {
        VStack(spacing: 25) {
            Image("LogoAppIcon")
                .resizable()
                .frame(width: 120, height: 120)
            
            CustomTextField(
                text: $viewModel.email,
                textTitle: RecoverPasswordEmailConstants.emailLabel.rawValue,
                placeHolder: RecoverPasswordEmailConstants.emailPlaceHolderLabel.rawValue,
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
}

#Preview {
    RecoverPasswordEmailView(viewModel: .init(), coordinator: .init(parentCoordinator: nil))
}
