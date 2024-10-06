//
//  AppCoordinatorType.swift
//  DigitalBuddy
//
//  Created by Gabriel Campos on 5/10/24.
//

import Foundation
import SwiftUI

// MARK: - AppCoordinatorType
protocol AppCoordinatorType: ObservableObject {
    // MARK: - Associated Types
    associatedtype Pages: Hashable
    associatedtype Sheet: Identifiable = Never
    associatedtype FullScreenCover: Identifiable = Never

    // MARK: - Properties
    var parentCoordinator: (any AppCoordinatorType)? { get set }
    var path: NavigationPath { get set }
    var sheet: Sheet? { get set }
    var fullScreenCover: FullScreenCover? { get set }
    
    // MARK: - Methods
    func push(page: Pages)
    func pop()
    func popToRoot()
    func presentSheet(_ sheet: Sheet)
    func presentFullScreenCover(_ cover: FullScreenCover)
    func dismissSheet()
    func dismissCover()
}
