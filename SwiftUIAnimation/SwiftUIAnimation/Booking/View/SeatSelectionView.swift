//
//  SeatSelectionView.swift
//  SwiftUIAnimation
//
//  Created by Sukhaman Singh on 10/20/24.
//

import SwiftUI

struct SeatSelectionView: View {
    @State private var seats: [[Seat]] = generateSeatLayout()

    // Pass selected seats to the action
    var selectedAction: ([Seat]) -> Void

    var body: some View {
        GeometryReader { geometry in
                VStack(spacing: 16) {
                    Text("Select Your Seats")
                        .font(.title)
                        .padding()
                    
                    // Display seat layout
                    ForEach(seats.indices, id: \.self) { rowIndex in
                        SeatRowView(seats: seats[rowIndex], onSeatTap: { seat in
                            toggleSeatSelection(seat: seat)
                        })
                    }

                    Spacer()

                    Button(action: {
                        // Pass selected seats to the parent action
                        selectedAction(selectedSeats())
                    }) {
                        Text("Confirm Selection")
                            .frame(maxWidth: geometry.size.width * 0.8) // Adjust button width relative to screen
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                }
                .padding()
                .frame(width: geometry.size.width,height: geometry.size.height * 0.75) // Full width of device
                .background(Color.white)
                .cornerRadius(20)
                .shadow(radius: 5)
            
        }
    }

    // Toggle the seat's selected state
    private func toggleSeatSelection(seat: Seat) {
        if let rowIndex = seats.firstIndex(where: { $0.contains(where: { $0.id == seat.id }) }) {
            if let seatIndex = seats[rowIndex].firstIndex(where: { $0.id == seat.id }) {
                seats[rowIndex][seatIndex].isSelected.toggle()
            }
        }
    }

    // Return a list of selected seats
    private func selectedSeats() -> [Seat] {
        seats.flatMap { $0.filter { $0.isSelected } }
    }
}

#Preview {
    SeatSelectionView(selectedAction: {_ in })
}
