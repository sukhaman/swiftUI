//
//  Movie.swift
//  ListView
//
//  Created by Sukhaman Singh on 10/15/24.
//

import Foundation

import Foundation

struct Movie: Identifiable, Codable {
    let id: Int
    let title: String
    let originalTitle: String
    let overview: String
    let posterPath: String?
    let backdropPath: String?
    let releaseDate: String
    let voteAverage: Double
    let voteCount: Int
    
    let popularity: Double
    let video: Bool
    let adult: Bool
    let originalLanguage: String
    
    // Computed properties to get full image URLs
    var posterURL: URL? {
        guard let posterPath = posterPath else { return nil }
        return URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)")
    }
    
    var backdropURL: URL? {
        guard let backdropPath = backdropPath else { return nil }
        return URL(string: "https://image.tmdb.org/t/p/w500\(backdropPath)")
    }
}

struct MovieResult: Codable {
    let results: [Movie]
}
