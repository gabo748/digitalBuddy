//
//  RestorePasswordCoordinator.swift
//  DigitalBuddy
//
//  Created by Gabriel Campos on 6/10/24.
//

import Foundation
import SwiftUI

final class RecoverPasswordCoordinator: AppCoordinatorType {
    typealias Pages = RestorePasswordScreens
    
    @Published var sheet: Never?
    @Published var fullScreenCover: Never?
    @Published var path: NavigationPath = NavigationPath()
    @Published var parentCoordinator: (any AppCoordinatorType)?
    
    init(parentCoordinator: (any AppCoordinatorType)?) {
        self.parentCoordinator = parentCoordinator
    }
    
    func push(page: RestorePasswordScreens) {
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
        screen: RestorePasswordScreens,
        coordinator: RecoverPasswordCoordinator,
        viewModel: RecoverPasswordViewModel
    ) -> some View {
        switch screen {
        case .emailVerification:
            RecoverPasswordEmailView(viewModel: viewModel, coordinator: coordinator)
        case .codeVerification:
            RecoverPasswordCodeVerificationView(viewModel: viewModel, coordinator: coordinator)
        case .resetPassword:
            RecoverPasswordFormView(viewModel: viewModel, coordinator: coordinator)
        }
    }
    
}
