//
//  Seat.swift
//  SwiftUIAnimation
//
//  Created by Sukhaman Singh on 10/20/24.
//

import Foundation

struct Seat: Identifiable {
    var id = UUID()
    var row: Int
    var column: Int
    var isAvailable: Bool = true
    var isSelected: Bool = false
    var seatNumber: String {
        "\(row)\(String(UnicodeScalar(65 + column)!))" // Example: 1A, 2B, etc.
    }
}
