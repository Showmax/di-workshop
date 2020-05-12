import XCTest
@testable import di_workshop

class MoviesListModelTests: XCTestCase {

    func test__loadMovies__produceDataForView() throws {
        // Arrange:
        let expectedMovieTitle = "Godfather of Harlem"
        let expectedWatchingProgress = "30%"
        let expectedWatchingProgressStored = 0.3
        let flow = MoviesListFlow(playMovie: { _ in })
        let model = MoviesListModel(flow: flow)
        // PROBLEM 1:
        // - untestable code
        // - because we cannot supply custom MoviesStore into MoviesListModel

        // Act:
        let firstMovie = model.loadMovies().first

        // Assert:
        XCTAssertEqual(firstMovie?.title, expectedMovieTitle)
        XCTAssertEqual(firstMovie?.watchingProgress, expectedWatchingProgress)
    }
}
