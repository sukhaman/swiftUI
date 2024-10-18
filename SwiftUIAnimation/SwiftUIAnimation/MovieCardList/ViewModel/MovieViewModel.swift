//
//  MovieViewModel.swift
//  SwiftUIAnimation
//
//  Created by Sukhaman Singh on 10/17/24.
//

import Foundation

class MovieViewModel: ObservableObject {
    @Published var popularMovies: [Movie] = []
    private let apiKey =  "04299a540d3f5d81355b84046916440d"
    private var httpClient: HTTPClientProtocol
    init (httpClient: HTTPClientProtocol = HTTPClient()) {
        self.httpClient = httpClient
        fetchAllMovies()
    }
    
    func fetchAllMovies() {
        Task {
            // Run all fetch tasks concurrently
            do {
                
                
                
                async let popular = try fetchPopularMovies()
               
                
                // Wait for all results to come in
                let (popularMovies) = try await (popular)
                
                // Update the UI with the fetched data on the main thread
                await MainActor.run {
                    self.popularMovies = popularMovies
                   
                }
            } catch {
                // If an error occurs, update the status to reflect the error
                
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


    
    
    
    // Remove the card from the stack
    func removeCard(at index: Int) {
        
        popularMovies.remove(at: index)
    }
}
