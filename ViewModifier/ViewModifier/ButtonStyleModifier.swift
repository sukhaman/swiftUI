//
//  ButtonStyleModifier.swift
//  ViewModifier
//
//  Created by Sukhaman Singh on 11/4/24.
//

import SwiftUI

struct ButtonStyleModifier: ViewModifier {
    var cornerRadius: CGFloat
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
            .cornerRadius(cornerRadius)
            .shadow(color: .gray, radius: 5, x: 0, y: 5)
    }
}

extension View {
    func customButtonStyle(cornerRadius: CGFloat) -> some View {
        self.modifier(ButtonStyleModifier(cornerRadius: cornerRadius))
    }
}

struct GradientBorderModifier<S: Shape>: ViewModifier {
    var shape: S
    var gradient: LinearGradient
    var lineWidth: CGFloat
    
    func body(content: Content) -> some View {
        content
            .overlay(
                shape
                    .stroke(gradient, lineWidth: lineWidth)
            )
    }
}

extension View {
    func gradientBorder<S: Shape>(_ shape: S, gradient: LinearGradient, lineWidth: CGFloat = 2) -> some View {
        self.modifier(GradientBorderModifier(shape: shape, gradient: gradient, lineWidth: lineWidth))
    }
}
