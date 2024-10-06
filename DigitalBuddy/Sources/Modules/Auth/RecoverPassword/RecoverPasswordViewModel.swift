//
//  RecoverPasswordViewModel.swift
//  DigitalBuddy
//
//  Created by Gabriel Campos on 6/10/24.
//

import Foundation

final class RecoverPasswordViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var verificationCode: String = ""
    @Published var newPassword: String = ""
    @Published var confirmedNewPassword: String = ""
}
