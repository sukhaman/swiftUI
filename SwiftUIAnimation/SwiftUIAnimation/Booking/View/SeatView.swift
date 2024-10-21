//
//  SeatView.swift
//  SwiftUIAnimation
//
//  Created by Sukhaman Singh on 10/20/24.
//

import SwiftUI

struct SeatView: View {
    var seat: Seat
    var onTap: () -> Void

    var body: some View {
        Button(action: {
            onTap() // Call the action passed from the parent view
        }) {
            Text(seat.seatNumber)
                .font(.caption)
                .frame(width: 40, height: 40)
                .background(seatBackgroundColor)
                .cornerRadius(8)
                .foregroundColor(.white)
        }
        .disabled(!seat.isAvailable) // Disable button if seat is not available
    }

    private var seatBackgroundColor: Color {
        if !seat.isAvailable {
            return Color.gray // Occupied seat
        } else if seat.isSelected {
            return Color.green // Selected seat
        } else {
            return Color.blue // Available seat
        }
    }
}

#Preview {
    SeatView(seat: Seat(row: 1, column: 3), onTap: {})
}
