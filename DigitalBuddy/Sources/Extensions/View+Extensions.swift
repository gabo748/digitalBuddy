//
//  View+Extensions.swift
//  DigitalBuddy
//
//  Created by Gabriel Campos on 6/10/24.
//

import Foundation
import SwiftUI

extension View {
    var safeAreaHeight: CGFloat {
        // Total screen height
        let totalHeight = UIScreen.main.bounds.height

        // Getting the key window from the connected scenes
        let window = UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .first?
            .keyWindow

        // Safe area insets
        let topInset = window!.safeAreaInsets.top
        let bottomInset = window!.safeAreaInsets.bottom

        // Screen height minus top and bottom safe area insets
        return totalHeight - topInset - bottomInset
    }
}
