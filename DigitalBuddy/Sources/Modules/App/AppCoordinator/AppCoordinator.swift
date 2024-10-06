//
//  AppCoordinator.swift
//  DigitalBuddy
//
//  Created by Gabriel Campos on 5/10/24.
//

import Foundation
import SwiftUI

final class AppCoordinator: AppCoordinatorType {
    
    typealias Pages = AppPages
    typealias Sheet = Never
    typealias FullScreenCover = AppFullScreen
    
    var parentCoordinator: (any AppCoordinatorType)?
    
    @Published var path: NavigationPath = NavigationPath()
    @Published var sheet: Never?
    @Published var fullScreenCover: AppFullScreen?
    
    init(parentCoordinator: (any AppCoordinatorType)?) {
        self.parentCoordinator = parentCoordinator
    }
    
    func push(page: AppPages) {
        path.append(page)
    }
    
    func presentSheet(_ sheet: Never) {}
    
    func presentFullScreenCover(_ cover: AppFullScreen) {
        self.fullScreenCover = cover
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func dismissSheet() {}
    
    func dismissCover() {
        self.fullScreenCover = nil
    }
    
    @ViewBuilder
    func makeScreen(page: AppPages, coordinator: AppCoordinator) -> some View {
        switch page {
        case .home:
            EmptyView()
        case .signIn:
            let interactor = SignInInteractor()
            let viewModel = SignInViewModel(interactor: interactor)
            SignInView(viewModel: viewModel, coordinator: coordinator)
        }
    }
    
    @ViewBuilder
    func makeFullScreen(_ fullScreenCover: AppFullScreen, coordinator: AppCoordinator) -> some View {
        switch fullScreenCover {
        case .signUp:
            let coordinator = SignUpCoordinator(parentCoordinator: coordinator)
            let viewModel = SignUpViewModel()
            SingUpCoordinatorView(coordinator: coordinator, viewModel: viewModel)
        case .forgotPassword:
            let coordinator = RecoverPasswordCoordinator(parentCoordinator: coordinator)
            let viewModel = RecoverPasswordViewModel()
            RecoverPasswordCoordinatorView(viewModel: viewModel, coordinator: coordinator)
        }
    }
    
}
