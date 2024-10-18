//
//  MainTabView.swift
//  SwiftUIAnimation
//
//  Created by Sukhaman Singh on 10/17/24.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            BumbleLikeStackView()
                .tabItem {
                    Label("Home", systemImage: "popcorn.circle.fill")
                }

            TinderLikeStackView()
                .tabItem {
                    Label("Movies", systemImage: "movieclapper")
                }
            AnimatedListView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}
