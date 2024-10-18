//
//  HTTPClient.swift
//  SwiftUIAnimation
//
//  Created by Sukhaman Singh on 10/17/24.
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

extension URLError {
    var customErrorMessage: String {
        switch self.code {
        case .timedOut:
            return "The request timed out. Please try again later."
        case .notConnectedToInternet:
            return "It seems you are not connected to the Internet. Please check your connection."
        case .cannotFindHost:
            return "The server could not be found. Please check the URL and try again."
        case .cannotConnectToHost:
            return "Unable to connect to the server. Please try again later."
        case .networkConnectionLost:
            return "The network connection was lost. Please try again."
        case .dnsLookupFailed:
            return "The DNS lookup failed. Please check your network settings."
        case .resourceUnavailable:
            return "The requested resource is unavailable."
        case .badServerResponse:
            return "The server returned an invalid response."
        case .unsupportedURL:
            return "The URL is not valid. Please check the format and try again."
        case .cannotParseResponse:
            return "The server response could not be parsed."
        default:
            return self.localizedDescription // Default message if no specific match
        }
    }
}
