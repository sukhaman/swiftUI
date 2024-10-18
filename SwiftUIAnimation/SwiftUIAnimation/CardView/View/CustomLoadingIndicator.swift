//
//  CustomLoadingIndicator.swift
//  SwiftUIAnimation
//
//  Created by Sukhaman Singh on 10/18/24.
//

import SwiftUI

struct CustomLoadingIndicator: View {
    @State private var circleStart: CGFloat = 0.0 // Controls the start point of the circle
    @State private var circleEnd: CGFloat = 0.0 // Controls the end point of the circle
    
    // Animation duration
    let animationDuration: Double = 2.0
    
    var body: some View {
        ZStack {
            // Background or any other content
            Color(.systemBackground)
                .ignoresSafeArea()
            
            // Circle Path Animation
            Circle()
                .trim(from: circleStart, to: circleEnd) // Animate both start and end
                .stroke(Color.blue, style: StrokeStyle(lineWidth: 5, lineCap: .round))
                .frame(width: 150, height: 150)
                .rotationEffect(.degrees(-90)) // Rotate to start at the top
                .onAppear {
                    startCircleAnimation() // Start repeating animation
                }
        }
    }
    
    private func startCircleAnimation() {
        // First step: Animate the start and end points to draw the circle
        withAnimation(Animation.easeInOut(duration: animationDuration)) {
            circleEnd = 1.0 // Animate end point towards completion
            circleStart = 0.0 // Keep start point at 0.0
        }
        
        // Once the circle is fully drawn, reset both values to zero
        DispatchQueue.main.asyncAfter(deadline: .now() + animationDuration) {
            withAnimation(Animation.easeInOut(duration: animationDuration)) {
                circleStart = 1.0 // Move start point to the end
                circleEnd = 1.0 // Keep end point at 1.0
            }
        }
        
        // Reset and restart after the full animation cycle
        DispatchQueue.main.asyncAfter(deadline: .now() + (2 * animationDuration)) {
            circleStart = 0.0 // Reset start point
            circleEnd = 0.0 // Reset end point
            startCircleAnimation() // Recursive call to repeat
        }
    }
}
#Preview {
    CustomLoadingIndicator()
}
