//
//  MockURLSession.swift
//  ListViewTests
//
//  Created by Sukhaman Singh on 10/15/24.
//

import Foundation
@testable import ListView

class MockURLSession: URLSessionProtcol {
    var responseData: Data?
    var responseError: URLError?
    var statusCode: Int = 200
    func data(from request: URLRequest) async throws -> (Data, URLResponse) {
        let urlResponse = HTTPURLResponse(url: request.url!, statusCode: statusCode, httpVersion: nil, headerFields: nil)!
        if let error = responseError {
            throw error
        }
        guard let data = responseData else {
            throw URLError(.unknown)
        }
        return (data, urlResponse)
    }
}
