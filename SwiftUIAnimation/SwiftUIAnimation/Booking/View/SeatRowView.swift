//
//  SeatRowView.swift
//  SwiftUIAnimation
//
//  Created by Sukhaman Singh on 10/20/24.
//

import SwiftUI

struct SeatRowView: View {
    var seats: [Seat]
    var onSeatTap: (Seat) -> Void
    
    var body: some View {
        HStack {
            ForEach(seats) { seat in
                SeatView(seat: seat) {
                    onSeatTap(seat) // Handle seat tap
                }
            }
        }
    }
}

#Preview {
    SeatRowView(seats: [], onSeatTap: {_ in })
}
