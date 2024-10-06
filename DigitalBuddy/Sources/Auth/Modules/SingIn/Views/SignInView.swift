//
//  SigInView.swift
//  DigitalBuddy
//
//  Created by Gabriel Campos on 5/10/24.
//

import SwiftUI

struct SignInView: View {
    // MARK: - Properties
    
    @StateObject private var viewModel: SignInViewModel
    @ObservedObject private var coordinator: AppCoordinator
    
    init(
        viewModel: SignInViewModel,
        coordinator: AppCoordinator
    ) {
        self._viewModel = StateObject(wrappedValue: viewModel)
        self._coordinator = ObservedObject(wrappedValue: coordinator)
    }
    
    var body: some View {
        ScrollView {
            VStack {
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
    
    var header: some View {
        HeaderView(
            title: SignInConstants.welcomeTitleLabel.rawValue,
            subtitle: SignInConstants.welcomeSubtitleLabel.rawValue
        )
    }
    
    
    var content: some View {
        VStack(spacing: 25) {
            Image("LogoAppIcon")
                .resizable()
                .frame(width: 120, height: 120)
            
            CustomTextField(
                text: $viewModel.email,
                textTitle: SignInConstants.userNameLabel.rawValue,
                placeHolder: SignInConstants.userNamePlaceHolder.rawValue,
                isNumericOnly: false
            )
            
            CustomSecureTextField(
                password: $viewModel.password,
                textTitle: SignInConstants.passwordLabel.rawValue,
                placeHolder: SignInConstants.passwordPlaceHolder.rawValue
            )
            
            Button(action: {
                
            }, label: {
                Text("Iniciar Sesión")
            })
            .buttonStyle(CustomButtonStyle())
            
        }
        .padding(.top, 50)
    }
    
    var footer: some View {
        VStack {
            HStack {
                Text(SignInConstants.forgotPasswordLabel.rawValue)
                Button {
                    coordinator.presentFullScreenCover(.forgotPassword)
                } label: {
                    Text(SignInConstants.forgotPasswordLinkLabel.rawValue)
                }
            }
            
            HStack {
                Text(SignInConstants.signUpLabel.rawValue)
                Button {
                    coordinator.presentFullScreenCover(.signUp)
                } label: {
                    Text(SignInConstants.signUpLabelLink.rawValue)
                }
            }
        }
        .font(.system(size: 15))
    }
}

#Preview {
    let interactor = SignInInteractor()
    return SignInView(viewModel: .init(interactor: interactor), coordinator: .init(parentCoordinator: nil))
}
