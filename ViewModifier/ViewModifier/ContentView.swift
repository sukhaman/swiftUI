//
//  ContentView.swift
//  ViewModifier
//
//  Created by Sukhaman Singh on 11/4/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
           
            Button {
                // Button action
            } label: {
                Text("Show Error")
                    .bold()
            }
            .customButtonStyle()

        }
        .padding()
    }
}

#Preview {
    ContentView()
}
