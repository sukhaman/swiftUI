//
//  AnimatedListView.swift
//  SwiftUIAnimation
//
//  Created by Sukhaman Singh on 10/17/24.
//

import SwiftUI

struct UserSettings: Equatable {
    var id = UUID()
    let name: String
    let image: String
    let color: Color
}

class AnimatedListViewModel: ObservableObject {
    @Published var list: [UserSettings] = []
    
    init() {
        createList()
    }
    
    func createList() {
        let profile = UserSettings(name: "Profile", image: "person.crop.circle",color: .red)
        list.append(profile)
        let account = UserSettings(name: "Account", image: "house",color: .pink)
        list.append(account)
        let history = UserSettings(name: "History", image: "house",color: .mint)
        list.append(history)
        let logout = UserSettings(name: "Logout", image: "tachometer",color: .purple)
        list.append(logout)
    }
}

struct AnimatedListView: View {
    @State private var isAnimating = false
    @StateObject var viewModel = AnimatedListViewModel()

    var body: some View {
        VStack {
            Text("Animated List")
                .font(.largeTitle)
                .padding(.bottom, 20)
            
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(viewModel.list.indices, id: \.self) { index in
                        HStack {
                            Spacer()
                            Image(systemName: viewModel.list[index].image)
                                .foregroundStyle(Color.white)
                            Text(viewModel.list[index].name)
                                .font(.headline)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .foregroundColor(.white)
                                
                        }
                        .background(viewModel.list[index].color)
                        .cornerRadius(10)
                        .opacity(isAnimating ? 1 : 0)
                        .offset(y: isAnimating ? 0 : -100)
                        .animation(
                            Animation.easeOut(duration: 0.6)
                                .delay(0.5 * Double(index)),
                            value: isAnimating
                        )
                    }
                }
                .padding()
            }
        }
        .onAppear {
            // Start the animation once the view appears
            isAnimating = true
        }
        .onDisappear {
            isAnimating = false
        }
    }
}

#Preview {
    AnimatedListView()
}
