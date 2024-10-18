//
//  CardView.swift
//  SwiftUIAnimation
//
//  Created by Sukhaman Singh on 10/17/24.
//

import SwiftUI

struct CardView: View {
    @State private var offset = CGSize.zero

    var body: some View {
        VStack {
            Text("Card")
                .font(.largeTitle)
                .bold()

            ZStack {
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.gray.opacity(0.2))
                    .frame(width: 300, height: 180)
                    .shadow(radius: 10)
                
                // Place the card information inside the RoundedRectangle
                CardInformationView()
                    .padding(.all,10) // Padding to prevent text from touching the edges
            }
            .offset(x: offset.width, y: 0) // Apply offset to entire ZStack, including info
            .gesture(
                DragGesture()
                    .onChanged { gesture in
                        offset = gesture.translation
                    }
                    .onEnded { _ in
                        // Spring back animation
                        withAnimation(.spring()) {
                            offset = .zero
                        }
                    }
            )
        }
    }
}

struct CardInformationView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Card Number: 1234 5678 9909 8765")
                .font(.headline)
            Text("Name: John Doe")
                .font(.subheadline)
                .padding(.top, 5)
            Text("Expiry: 12/25")
                .font(.subheadline)
                .padding(.top, 5)
        }
        .foregroundColor(.black) // Make the text visible
    }
}



#Preview {
    CardView()
}
