//
//  AppPages.swift
//  DigitalBuddy
//
//  Created by Gabriel Campos on 5/10/24.
//

import Foundation

enum AppPages: Hashable {
    case home
    case signIn
}

enum AppFullScreen: Identifiable {
    case signUp
    case forgotPassword
    
    var id: Self { return self }
}
