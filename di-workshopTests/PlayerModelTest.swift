import XCTest
@testable import di_workshop

class PlayerModelTest: XCTestCase {

    func test_loadState__expectToLoadMovieDetailsForPlayer() throws {
        // Arrange:
        let movieID = "movie-a"
        let expectedMovieTitle = "Godfather of Harlem"
        let expectedMovieURL = URL(string: "http://movies.com/\(movieID).mp4")!
        let expectedWatchingProgressStored = 0.3
        let model = PlayerModel(movieID: movieID)
        // PROBLEM 1:
        // - untestable code
        // - because we cannot supply custom MoviesStore into PlayerModel

        // Act:
        model.loadState()

        // Assert:
        if case .loaded(let title, let url, let progress) = model.state {
            XCTAssertEqual(title, expectedMovieTitle)
            XCTAssertEqual(url, expectedMovieURL)
            XCTAssertEqual(progress, expectedWatchingProgressStored)
        } else {
            XCTFail("Cannot load movie")
        }
    }
}
