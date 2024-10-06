//
//  SignInViewModel.swift
//  DigitalBuddy
//
//  Created by Gabriel Campos on 5/10/24.
//

import Foundation

final class SignInViewModel: ObservableObject {
    // MARK: Published Properties
    @Published var email: String = ""
    @Published var password: String = ""
    
    // MARK: Properties
    private let interactor: SignInInteractorType
    
    // MARK: - Initializer
    init(interactor: SignInInteractorType) {
        self.interactor = interactor
    }
}
