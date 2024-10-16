//
//  MoviewViewModelTests.swift
//  ListViewTests
//
//  Created by Sukhaman Singh on 10/15/24.
//


@testable import ListView
import Testing
import Foundation

class MovieViewModelTests {
    
    @Test
    func fetchAllMoviesSuccess() {
        let mockSession = MockURLSession()
        let httpClient = HTTPClient(session: mockSession)
        let viewModel = MovieViewModel(httpClient: httpClient)
        // Arrange: Mock Data
        let mockMovie = Movie(id: 1, title: "Inception", originalTitle: "Inception", overview: "", posterPath: nil, backdropPath: nil, releaseDate: "12/04/2022", voteAverage: 3, voteCount: 2, popularity: 21, video: false, adult: false, originalLanguage: "English")
        let mockMovieResult = MovieResult(results: [mockMovie])
        let mockData = try! JSONEncoder().encode(mockMovieResult)
        mockSession.responseData = mockData
        
        // Act: call the fetch movies method
        
        viewModel.fetchAllMovies()
        if case .loaded(let popularMovies) = viewModel.popularMoviesStatus {
            #expect(popularMovies.count == 1)
            #expect(popularMovies.first?.title == "Inception")
        }
    }
    
    @Test
    func fetchAllMoviesFailure() {
        let mockSession = MockURLSession()
        let httpClient = HTTPClient(session: mockSession)
        let viewModel = MovieViewModel(httpClient: httpClient)
        // Arrange: Mock Data
        
        mockSession.responseError = URLError(URLError.cannotFindHost, userInfo: ["error":"Bad URL"])
        
        // Act: call the fetch movies method
        viewModel.fetchAllMovies()
        if case .error(let message) = viewModel.popularMoviesStatus {
            #expect(message == "The server could not be found. Please check the URL and try again.")
        }
    }
}
