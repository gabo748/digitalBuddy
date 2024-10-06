//
//  SignUpCoordinator.swift
//  DigitalBuddy
//
//  Created by Gabriel Campos on 6/10/24.
//

import Foundation
import SwiftUI

final class SignUpCoordinator: AppCoordinatorType {
    typealias Pages = SignUpScreens
    
    // MARK: - Published Properties
    @Published var sheet: Never?
    @Published var path: NavigationPath = NavigationPath()
    @Published var fullScreenCover: Never?
    
    // MARK: - Properties
    var parentCoordinator: (any AppCoordinatorType)?
    
    // MARK: - Initializer
    
    init(parentCoordinator: (any AppCoordinatorType)?) {
        self.parentCoordinator = parentCoordinator
    }
    
    func push(page: SignUpScreens) {
        path.append(page)
    }
    
    func presentSheet(_ sheet: Never) {}
    
    func presentFullScreenCover(_ cover: Never) {}
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func dismissSheet() {}
    
    func dismissCover() {}
    
    @ViewBuilder
    func makeView(
        screens: SignUpScreens,
        viewModel: SignUpViewModel,
        coordinator: SignUpCoordinator
    ) -> some View {
        switch screens {
        case .emailVerification:
            EmailVerificationView(viewModel: viewModel, coordinator: coordinator)
        case .codeVerification:
            CodeVerificationView(viewModel: viewModel, coordinator: coordinator)
        case .userInformationForm:
            UserSignUpForm(viewModel: viewModel, coordinator: coordinator)
        }
    }
    
    
}
