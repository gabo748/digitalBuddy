//
//  SignUpViewModel.swift
//  DigitalBuddy
//
//  Created by Gabriel Campos on 6/10/24.
//

import Foundation

final class SignUpViewModel: ObservableObject {
    // MARK: - Properties
    @Published var email: String = ""
    
    @Published var verificationCode: String = ""
    
    @Published var username: String = ""
    
    @Published var password: String = ""
    
    @Published var confirmPassword: String = ""
}
