//
//  MovieListView.swift
//  ListView
//
//  Created by Sukhaman Singh on 10/15/24.
//

import SwiftUI

struct MovieListView: View {
    @StateObject var viewModel = MovieViewModel()
    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView {
                   
                        VStack(spacing:0) {
                            // Popular Movie List View
                            MovieCategoryListView(movies: viewModel.popularMovies,title: "Popular")
                            // Top Rated Movie List View
                            MovieCategoryListView(movies: viewModel.topRatedMovies,title: "Top Rated")
                                
                        }
                        .padding(.leading,10)
                    
                    
                }
            }
            .background(Color.white)
            
        }
    }
}

#Preview {
    MovieListView()
}
