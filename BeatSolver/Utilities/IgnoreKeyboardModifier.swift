//
//  IgnoreKeyboardModifier.swift
//  BeatSolver
//
//  Created by Jessica Elle on 9/2/24.
//

import SwiftUI


struct IgnoreKeyboardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .ignoresSafeArea(.keyboard, edges: .bottom) // Ignore the keyboard's safe area
    }
}

extension View {
    func ignoreKeyboard() -> some View {
        self.modifier(IgnoreKeyboardModifier())
    }
}

