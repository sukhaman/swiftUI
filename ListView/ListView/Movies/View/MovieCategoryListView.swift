//
//  MovieCategoryListView.swift
//  ListView
//
//  Created by Sukhaman Singh on 10/15/24.
//

import SwiftUI

struct MovieCategoryListView: View {
    var status: NetworkStatus<[Movie]>
    var title: String = ""
    var body: some View {
        
        switch status {
        case .idle:
            Text("Idle...")
                .foregroundColor(.gray)

        case .loading:
            ProgressView("Loading...")
        case .loaded(let movies):
            VStack(spacing: 0) {
                HStack {
                    
                    Text(title)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.black)
                        .padding(.horizontal)
                    Spacer()
                }
                .padding(.top,10)
                
                // Horizontal scroll view for popular movies
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(movies) { movie in
                            VStack {
                                if let posterURL = movie.posterURL {
                                    CachedAsyncImage(url: posterURL, placeholder: Image(systemName: "photo"), width: 100, height: 150)
                                }
                                Text(movie.title)
                                    .frame(width: 140,height: 40)
                                    .font(.caption)
                                    .foregroundStyle(Color.black)
                                    .multilineTextAlignment(.center)
                                    .lineLimit(2)
                                    
                            }
                        }
                    }
                    .padding(.horizontal)
                   
                }
                .padding(.vertical,10)
            }
        case .error(let message):
            Text(message)
                               .foregroundColor(.red)
        }
    }
    
}

#Preview {
    MovieCategoryListView(status: .idle)
}
