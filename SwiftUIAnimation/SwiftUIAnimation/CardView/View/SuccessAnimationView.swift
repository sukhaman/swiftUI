//
//  SuccessAnimationView.swift
//  SwiftUIAnimation
//
//  Created by Sukhaman Singh on 10/17/24.
//

import SwiftUI

struct SuccessAnimationView: View {
    @State private var isCompleted = false
    @Binding var progress: CGFloat
    
    var body: some View {
        VStack {
            if isCompleted {
                Text("🎉 Success!")
                    .font(.largeTitle)
                    .scaleEffect(isCompleted ? 1.5 : 1)
                    .animation(.spring(), value: isCompleted)
            }
            
            Button(action: {
                withAnimation {
                    progress += 20 // Simulate lesson progress
                    if progress >= 100 {
                        isCompleted = true
                    }
                }
            }) {
                Text("Complete Task")
                    .font(.title)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
    }
}

#Preview {
    SuccessAnimationView(progress: .constant(0))
}
