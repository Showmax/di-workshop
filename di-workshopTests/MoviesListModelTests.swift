import XCTest
@testable import di_workshop

class MoviesListModelTests: XCTestCase {

    func test__loadMovies__produceDataForView() throws {
        // Arrange:
        let expectedMovieTitle = "Godfather of Harlem"
        let expectedWatchingProgress = "30%"
        let expectedWatchingProgressStored = 0.3
        let movies = MoviesStore()
        let watchingProgress = WatchingProgressStore()
        // PROBLEM 2:
        // - untestable code
        // - we cannot influence what goes from stores
        //    - we could add new method for setting up mock data, but doing this just for sake of test is bad idea
        //      as will need to maintain it just for sake of test, while not needed in production
        let deps = MoviesListModel.Dependencies(movies: movies, watchingProgress: watchingProgress)
        let flow = MoviesListFlow(playMovie: { _ in })
        let model = MoviesListModel(deps: deps, flow: flow)

        // Act:
        let firstMovie = model.loadMovies().first

        // Assert:
        XCTAssertEqual(firstMovie?.title, expectedMovieTitle)
        XCTAssertEqual(firstMovie?.watchingProgress, expectedWatchingProgress)
    }
}
