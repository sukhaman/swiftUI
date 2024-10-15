//
//  HTTPClient.swift
//  ListView
//
//  Created by Sukhaman Singh on 10/15/24.
//

import Foundation

protocol URLSessionProtcol {
    func data(from request: URLRequest) async throws -> (Data, URLResponse)
}

class URLSessionWrapper: URLSessionProtcol {
   
    
    private let session: URLSession
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func data(from request: URLRequest) async throws -> (Data, URLResponse) {
        return try await session.data(for: request)
    }
}

protocol HTTPClientProtocol {
    func performRequest(from request: URLRequest) async throws -> (Data, URLResponse)
}


class HTTPClient: HTTPClientProtocol {
    private let session: URLSessionProtcol
    init(session: URLSessionProtcol = URLSessionWrapper()) {
        self.session = session
    }
    
    func performRequest(from request: URLRequest) async throws -> (Data, URLResponse) {
        return try await session.data(from: request)
    }
}
