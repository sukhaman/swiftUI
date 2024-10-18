//
//  FlashCard.swift
//  SwiftUIAnimation
//
//  Created by Sukhaman Singh on 10/17/24.
//

import SwiftUI

struct FlashCard: View {
    @State private var isFlipped = false
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(isFlipped ? Color.green : Color.blue)
                .frame(width: 300, height: 200)
                .rotation3DEffect(Angle(degrees: isFlipped ? 180 : 0), axis: (x:0, y:1,z:0)
                )

                .overlay {
                    Text(isFlipped ? "Correct Answer" : "Translate Apple")
                        .font(.largeTitle)
                        .foregroundStyle(Color.white)
                        .onTapGesture {
                            withAnimation {
                                isFlipped.toggle()
                            }
                        }
                }
        }
    }
}

#Preview {
    FlashCard()
}
