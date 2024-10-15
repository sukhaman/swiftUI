//
//  MovieCategoryListView.swift
//  ListView
//
//  Created by Sukhaman Singh on 10/15/24.
//

import SwiftUI

struct MovieCategoryListView: View {
    var movies: [Movie] = []
    var title: String = ""
    var body: some View {
       
            VStack(spacing: 0) {
                HStack {
                    
                    Text(title)
                        .font(.title2)
                        .fontWeight(.bold)
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
                                    AsyncImage(url: posterURL) { image in
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 100, height: 150)
                                            .cornerRadius(8)
                                    } placeholder: {
                                        ProgressView()
                                            .frame(width: 100, height: 150)
                                    }
                                }
                                Text(movie.title)
                                    .font(.caption)
                                    .multilineTextAlignment(.leading)
                                    .lineLimit(2)
                            }
                        }
                    }
                    .padding(.horizontal)
                   
                }
                .padding(.vertical,10)
                
            }
            .background(Color.white)
    }
    
}

#Preview {
    MovieCategoryListView()
}
