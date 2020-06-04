import XCTest
@testable import di_workshop

class MoviesListModelTests: XCTestCase {

    func test__loadMovies__produceDataForView() throws {
        // Arrange:
        let expectedMovieTitle = "Godfather of Harlem"
        let expectedWatchingProgress = "30%"
        let expectedWatchingProgressStored = 0.3
        let movies = MoviesStoreMock()
        movies.loadMoviesReturnValue = [Movie(id: "a", title: expectedMovieTitle, url: URL(string: "http://www.showmax.com")!)]
        DI.mock(MoviesStore.self, instantiator: { movies })
        let watchingProgress = WatchingProgressStoreMock()
        watchingProgress.loadWatchingProgressForMovieIDReturnValue = expectedWatchingProgressStored
        DI.mock(WatchingProgressStore.self, instantiator: { watchingProgress })
        let flow = MoviesListFlow(playMovie: { _ in })
        let model = MoviesListModel(flow: flow)

        // Act:
        let firstMovie = model.loadMovies().first

        // Assert:
        XCTAssertEqual(firstMovie?.title, expectedMovieTitle)
        XCTAssertEqual(firstMovie?.watchingProgress, expectedWatchingProgress)
    }
}
