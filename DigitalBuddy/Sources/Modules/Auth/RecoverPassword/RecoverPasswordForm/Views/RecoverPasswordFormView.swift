//
//  RecoverPasswordFormView.swift
//  DigitalBuddy
//
//  Created by Gabriel Campos on 6/10/24.
//

import SwiftUI

struct RecoverPasswordFormView: View {
    @ObservedObject private var viewModel: RecoverPasswordViewModel
    @ObservedObject private var coordinator: RecoverPasswordCoordinator
    
    init(viewModel: RecoverPasswordViewModel, coordinator: RecoverPasswordCoordinator) {
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
            title: RecoverPasswordFormConstants.headerRecoverPasswordForm.rawValue,
            subtitle: RecoverPasswordFormConstants.headerRecoverPasswordSubtitle.rawValue
        )
    }
    
    var content: some View {
        VStack(spacing: 25) {
            Image("LogoAppIcon")
                .resizable()
                .frame(width: 120, height: 120)
            
            CustomSecureTextField(
                password: $viewModel.newPassword,
                textTitle: RecoverPasswordFormConstants.newPasswordLabel.rawValue,
                placeHolder: RecoverPasswordFormConstants.newPasswordPlaceHolder.rawValue
            )
            
            CustomSecureTextField(
                password: $viewModel.confirmedNewPassword,
                textTitle: RecoverPasswordFormConstants.confirmPasswordLabel.rawValue,
                placeHolder: RecoverPasswordFormConstants.confirmPasswordPlaceHolder.rawValue
            )
            
            Button(action: {
                coordinator.parentCoordinator?.dismissCover()
            }, label: {
                Text(RecoverPasswordFormConstants.updatePasswordLabel.rawValue)
            })
            .buttonStyle(CustomButtonStyle())
            
        }
        .padding(.top, 50)
    }
}

#Preview {
    RecoverPasswordFormView(viewModel: .init(), coordinator: .init(parentCoordinator: nil))
}
