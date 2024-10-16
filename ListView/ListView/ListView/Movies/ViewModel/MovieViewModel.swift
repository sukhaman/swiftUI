//
//  MovieViewModel.swift
//  ListView
//
//  Created by Sukhaman Singh on 10/15/24.
//

import Foundation

class MovieViewModel: ObservableObject {
    @Published var popularMoviesStatus: NetworkStatus<[Movie]> = .idle
    @Published var topRatedMoviesStatus: NetworkStatus<[Movie]> = .idle
    @Published var upcomingMoviesStatus: NetworkStatus<[Movie]> = .idle
    private let apiKey = Environment.shared.get("API_KEY") ?? ""
    private var httpClient: HTTPClientProtocol
    init (httpClient: HTTPClientProtocol = HTTPClient()) {
        self.httpClient = httpClient
        fetchAllMovies()
    }
    
    func fetchAllMovies() {
        Task {
            // Run all fetch tasks concurrently
            do {
                
                await MainActor.run {
                    self.popularMoviesStatus = .loading
                    self.topRatedMoviesStatus = .loading
                    self.upcomingMoviesStatus = .loading
                }
                
                async let popular = try fetchPopularMovies()
                async let topRated = try fetchTopRatedMovies()
                async let upcoming = try fetchUpcomingMovies()
                
                // Wait for all results to come in
                let (popularMovies, topRatedMovies, upcomingMovies) = try await (popular, topRated, upcoming)
                
                // Update the UI with the fetched data on the main thread
                await MainActor.run {
                    self.popularMoviesStatus = .loaded(popularMovies)
                    self.topRatedMoviesStatus = .loaded(topRatedMovies)
                    self.upcomingMoviesStatus = .loaded(upcomingMovies)
                }
            } catch {
                // If an error occurs, update the status to reflect the error
                await MainActor.run {
                    self.popularMoviesStatus = .error("Failed to fetch popular movies")
                    self.topRatedMoviesStatus = .error("Failed to fetch top-rated movies")
                    self.upcomingMoviesStatus = .error("Failed to fetch upcoming movies")
                }
            }
        }
    }
    
    func fetchPopularMovies() async throws -> [Movie] {
        
        // Example URL (replace with your actual API URL)
        let urlString = "https://api.themoviedb.org/3/movie/popular?api_key=\(apiKey)" // Replace with your API endpoint
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        let request = URLRequest(url: url)
        do {
            let (data, _) = try await httpClient.performRequest(from: request)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodedMovies = try decoder.decode(MovieResult.self, from: data)
            return decodedMovies.results
        } catch {
            throw error
        }
    }
    
    func fetchTopRatedMovies() async throws -> [Movie] {
        // Example URL (replace with your actual API URL)
        let urlString = "https://api.themoviedb.org/3/movie/top_rated?api_key=\(apiKey)" // Replace with your API endpoint
        guard let url = URL(string: urlString) else { throw URLError(.badURL) }
        let request = URLRequest(url: url)
        do {
            let (data, _) = try await HTTPClient().performRequest(from: request)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodedMovies = try decoder.decode(MovieResult.self, from: data)
            return  decodedMovies.results
            
        } catch {
            throw error
        }
    }
    
    func fetchUpcomingMovies() async throws -> [Movie] {
        // Example URL (replace with your actual API URL)
        let urlString = "https://api.themoviedb.org/3/movie/upcoming?api_key=\(apiKey)" // Replace with your API endpoint
        guard let url = URL(string: urlString) else { throw URLError(.badURL) }
        let request = URLRequest(url: url)
        do {
            let (data, _) = try await HTTPClient().performRequest(from: request)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodedMovies = try decoder.decode(MovieResult.self, from: data)
            return decodedMovies.results
            
        } catch {
            throw error
        }
    }
}
