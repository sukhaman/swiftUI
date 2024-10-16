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
                            MovieCategoryListView(status: viewModel.popularMoviesStatus,title: "Popular")
                            // Top Rated Movie List View
                            MovieCategoryListView(status: viewModel.topRatedMoviesStatus,title: "Top Rated")
                            // Upcoming Movie List View
                            MovieCategoryListView(status: viewModel.upcomingMoviesStatus,title: "Upcoming")

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
