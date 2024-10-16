//
//  MovieTests.swift
//  ListViewTests
//
//  Created by Sukhaman Singh on 10/15/24.
//


@testable import ListView
import Testing

class MovieTests {

    @Test func movieInitialization() {
        let movie = Movie(id: 1, title: "Inception", originalTitle: "Inception", overview: "", posterPath: nil, backdropPath: nil, releaseDate: "12/04/2022", voteAverage: 3, voteCount: 2, popularity: 21, video: false, adult: false, originalLanguage: "English")
        #expect(movie.title == "Inception")
        
    }
}
