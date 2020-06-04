import XCTest
@testable import di_workshop

class PlayerModelTest: XCTestCase {

    func test_loadState__expectToLoadMovieDetailsForPlayer() throws {
        // Arrange:
        let movieID = "movie-a"
        let expectedMovieTitle = "Godfather of Harlem"
        let expectedMovieURL = URL(string: "http://movies.com/\(movieID).mp4")!
        let expectedWatchingProgressStored = 0.3
        let movies = MoviesStoreMock()
        movies.movieByIDReturnValue = Movie(id: movieID, title: expectedMovieTitle, url: expectedMovieURL)
        let watchingProgress = WatchingProgressStoreMock()
        watchingProgress.loadWatchingProgressForMovieIDReturnValue = expectedWatchingProgressStored
        let deps = PlayerModel.Dependencies(movies: movies, watchingProgress: watchingProgress)
        let model = PlayerModel(deps: deps, movieID: movieID)

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
