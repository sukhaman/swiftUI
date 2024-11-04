//
//  ButtonStyleModifier.swift
//  ViewModifier
//
//  Created by Sukhaman Singh on 11/4/24.
//

import SwiftUI

struct ButtonStyleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [.blue, .purple]),
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .foregroundColor(.white)
            .cornerRadius(10)
            .shadow(color: .gray, radius: 5, x: 0, y: 5)
    }
}

extension View {
    func customButtonStyle() -> some View {
        self.modifier(ButtonStyleModifier())
    }
}
