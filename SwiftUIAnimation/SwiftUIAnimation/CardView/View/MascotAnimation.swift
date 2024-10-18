//
//  MascotAnimation.swift
//  SwiftUIAnimation
//
//  Created by Sukhaman Singh on 10/17/24.
//

import SwiftUI

struct MascotAnimation: View {
    @State private var bounce = false
    var body: some View {
        Image(systemName: "tortoise.fill")
            .resizable()
            .frame(width: 100,height: 100)
            .scaleEffect(bounce ? 1.1 : 1)
            .rotationEffect(Angle(degrees: bounce ? 10 : -10))
            .animation(Animation.easeInOut(duration: 0.8).repeatForever(autoreverses: true), value: bounce)
            .onAppear {
                bounce.toggle()
            }
    }
}

#Preview {
    MascotAnimation()
}
