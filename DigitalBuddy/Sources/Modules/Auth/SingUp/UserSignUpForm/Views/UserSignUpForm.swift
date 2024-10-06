//
//  UserSignUpForm.swift
//  DigitalBuddy
//
//  Created by Gabriel Campos on 6/10/24.
//

import SwiftUI

struct UserSignUpForm: View {
    // MARK: - Properties
    
    @ObservedObject private var viewModel: SignUpViewModel
    @ObservedObject private var coordinator: SignUpCoordinator
    
    private var cameraIcon: String = "camera.shutter.button"
    
    // MARK: - Initializer
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
            title: UserSignUpFormConstants.welcomeHeaderTitleLabel.rawValue,
            subtitle: UserSignUpFormConstants.registerYourInformationSubtitle.rawValue
        )
    }
    
    var content: some View {
        VStack(spacing: 25) {
            Button(action: {
                // TODO: REQUEST CAMERA PERMISSION THEN SHOW CAMERA
            }, label: {
                Circle()
                    .frame(width: 120, height: 120)
                    .adaptiveForegroundStyle(lightColor: .gray.opacity(0.5), darkColor: .gray.opacity(0.5))
                    .overlay {
                        Image(systemName: cameraIcon)
                            .resizable()
                            .frame(width: 30, height: 30)
                            .adaptiveForegroundStyle(lightColor: .black, darkColor: .white)
                    }
            })
            
            CustomTextField(
                text: $viewModel.username,
                textTitle: UserSignUpFormConstants.userNameLabel.rawValue,
                placeHolder: UserSignUpFormConstants.userNamePlaceHolderLabel.rawValue,
                isNumericOnly: false
            )
            
            CustomSecureTextField(
                password: $viewModel.password,
                textTitle: UserSignUpFormConstants.passwordLabel.rawValue,
                placeHolder: UserSignUpFormConstants.passwordPlaceHolderLabel.rawValue
            )
            
            CustomSecureTextField(
                password: $viewModel.confirmPassword,
                textTitle: UserSignUpFormConstants.confirmPasswordLabel.rawValue,
                placeHolder: UserSignUpFormConstants.confirmPasswordPlaceHolderLabel.rawValue
            )
            
            Button(action: {
                
            }, label: {
                Text(UserSignUpFormConstants.registerButtonLabel.rawValue)
            })
            .buttonStyle(ConfirmationAppButtonStyle())
        }
    }
    
    var footer: some View {
        VStack {
            HStack {
                Text(UserSignUpFormConstants.footerAccountLabel.rawValue)
                Button {
                    coordinator.parentCoordinator?.dismissCover()
                } label: {
                    Text(UserSignUpFormConstants.footerSignInLabel.rawValue)
                }
            }
        }
    }
}

#Preview {
    UserSignUpForm(viewModel: .init(), coordinator: .init(parentCoordinator: nil))
}
