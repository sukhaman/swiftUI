//
//  FlightInformation.swift
//  SwiftUIAnimation
//
//  Created by Sukhaman Singh on 10/21/24.
//

import Foundation

struct FlightInformation: Codable {
    var id = UUID()
    var price: String
    var airline: String
    var flightClass: String
    var time: String
}
