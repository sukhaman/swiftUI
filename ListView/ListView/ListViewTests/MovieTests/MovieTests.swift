//
//  MovieTests.swift
//  ListViewTests
//
//  Created by Sukhaman Singh on 10/15/24.
//


@testable import ListView
import XCTest

class MovieTests: XCTestCase {

    func testMovieInitialization() {
        let movie = Movie(title: "Inception", genre: "Science Fiction")
        XCTAssertEqual(movie.title, "Inception")
        XCTAssertEqual(movie.genre, "Science Fiction")
    }
}
