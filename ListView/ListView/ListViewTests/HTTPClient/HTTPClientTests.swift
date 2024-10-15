//
//  HTTPClientTests.swift
//  ListViewTests
//
//  Created by Sukhaman Singh on 10/15/24.
//

import Testing
@testable import ListView
import Foundation

class HTTPClientTests {
    
    
    @Test
    func performRequestSuccess() async throws {
        // Arrange
       let mockSession = MockURLSession()
        let httpClient = HTTPClient(session: mockSession)
        let mockData = "{\"message\": \"Success\"}".data(using: .utf8)
        mockSession.responseData = mockData
        mockSession.statusCode = 200
        let request = URLRequest(url: URL(string: "https://example.com")!)
        // Act
        
        let (data, _) = try await httpClient.performRequest(from: request)
        
        // Assert
        #expect(data == mockData)
    }
    @Test
    func performRequestFailure() async throws {
        // Arrange
       let mockSession = MockURLSession()
        let httpClient = HTTPClient(session: mockSession)
        mockSession.responseError = nil
        mockSession.statusCode = 500
        let request = URLRequest(url: URL(string: "https://example.com")!)
        // Act
        do {
            _ = try await httpClient.performRequest(from: request)
        } catch {
            // Assert
            #expect((error as? URLError)?.code == URLError.unknown)
        }
    }

}
