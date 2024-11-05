//
//  ContentView.swift
//  ViewModifier
//
//  Created by Sukhaman Singh on 11/4/24.
//

import SwiftUI

struct ContentView: View {
    @State private var notificationCount = 5
    @State private var blurActive = false
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    Image(systemName: "bell.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .badge(count: notificationCount, color: .red, offsetX: 15, offsetY: -15)
                }
                .padding()
                Spacer()
                
                Button {
                    notificationCount += 1
                } label: {
                    Image(systemName: "plus")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30,height: 30)
                }
                .customButtonStyle(cornerRadius: 30)
                
                Spacer()
                
                
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
