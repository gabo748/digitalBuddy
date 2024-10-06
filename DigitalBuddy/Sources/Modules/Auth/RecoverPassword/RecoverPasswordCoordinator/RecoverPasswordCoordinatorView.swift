//
//  RecoverPasswordCoordinatorView.swift
//  DigitalBuddy
//
//  Created by Gabriel Campos on 6/10/24.
//

import SwiftUI

struct RecoverPasswordCoordinatorView: View {
    @StateObject private var viewModel: RecoverPasswordViewModel
    @StateObject private var coordinator: RecoverPasswordCoordinator
    
    init(viewModel: RecoverPasswordViewModel, coordinator: RecoverPasswordCoordinator) {
        self._viewModel = StateObject(wrappedValue: viewModel)
        self._coordinator = StateObject(wrappedValue: coordinator)
    }
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.makeView(
                screen: .emailVerification,
                coordinator: coordinator,
                viewModel: viewModel
            )
            .navigationDestination(for: RestorePasswordScreens.self) { screen in
                coordinator.makeView(
                    screen: screen,
                    coordinator: coordinator,
                    viewModel: viewModel
                )
            }
        }
    }
}
