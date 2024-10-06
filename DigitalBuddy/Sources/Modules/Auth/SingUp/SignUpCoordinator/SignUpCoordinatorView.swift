//
//  SignUpCoordinatorView.swift
//  DigitalBuddy
//
//  Created by Gabriel Campos on 6/10/24.
//

import SwiftUI

struct SingUpCoordinatorView: View {
    @StateObject private var coordinator: SignUpCoordinator
    @StateObject private var viewModel: SignUpViewModel
    
    init(coordinator: SignUpCoordinator, viewModel: SignUpViewModel) {
        self._coordinator = StateObject(wrappedValue: coordinator)
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.makeView(screens: .emailVerification, viewModel: viewModel, coordinator: coordinator)
                .navigationDestination(for: SignUpScreens.self) { screen in
                    coordinator.makeView(screens: screen, viewModel: viewModel, coordinator: coordinator)
                }
        }
    }
}
