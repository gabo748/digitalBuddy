//
//  AppCoordinatorView.swift
//  DigitalBuddy
//
//  Created by Gabriel Campos on 5/10/24.
//

import SwiftUI

struct AppCoordinatorView: View {
    @StateObject private var coordinator = AppCoordinator(parentCoordinator: nil)
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.makeScreen(page: .signIn, coordinator: coordinator)
                .navigationDestination(for: AppPages.self) { page in
                    coordinator.makeScreen(page: page, coordinator: coordinator)
                }
                .fullScreenCover(item: $coordinator.fullScreenCover) { fullScrenCover in
                    coordinator.makeFullScreen(fullScrenCover, coordinator: coordinator)
                }
        }
    }
}
