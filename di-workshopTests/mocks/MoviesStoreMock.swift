import XCTest
@testable import di_workshop

class MoviesStoreMock: MoviesStore {

    var loadMoviesReturnValue: [Movie]!
    func loadMovies() -> [Movie] {
        return loadMoviesReturnValue
    }

    var movieByIDReturnValue: Movie?
    func movieByID(_ id: String) -> Movie? {
        return movieByIDReturnValue
    }
}

/// PROBLEM 3
/// - hard to manage
/// - boilerplate code, not used in production
/// - on each change you have to write similar setters again and again
