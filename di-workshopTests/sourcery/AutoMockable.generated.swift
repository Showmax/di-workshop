// Generated using Sourcery 0.18.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

@testable import di_workshop

// MARK: - Flows
// Expected to have struct with name SomeModuleFlow, which contain only non-optional closures as properties

// MARK: - AutoMockable protocols
class MoviesStoreMock: MoviesStore {

    // MARK: - loadMovies

    var loadMoviesCallsCount = 0
    var loadMoviesCalled: Bool {
        return loadMoviesCallsCount > 0
    }
    var loadMoviesReturnValue: [Movie]!
    var loadMoviesClosure: (() -> [Movie])?

    func loadMovies() -> [Movie] {
        loadMoviesCallsCount += 1
        return loadMoviesClosure.map({ $0() }) ?? loadMoviesReturnValue
    }

    // MARK: - movieByID

    var movieByIDCallsCount = 0
    var movieByIDCalled: Bool {
        return movieByIDCallsCount > 0
    }
    var movieByIDReceivedId: String?
    var movieByIDReturnValue: Movie?
    var movieByIDClosure: ((String) -> Movie?)?

    func movieByID(_ id: String) -> Movie? {
        movieByIDCallsCount += 1
        movieByIDReceivedId = id
        return movieByIDClosure.map({ $0(id) }) ?? movieByIDReturnValue
    }

}
class WatchingProgressStoreMock: WatchingProgressStore {

    // MARK: - loadWatchingProgressForMovieID

    var loadWatchingProgressForMovieIDCallsCount = 0
    var loadWatchingProgressForMovieIDCalled: Bool {
        return loadWatchingProgressForMovieIDCallsCount > 0
    }
    var loadWatchingProgressForMovieIDReceivedMovieID: String?
    var loadWatchingProgressForMovieIDReturnValue: Double!
    var loadWatchingProgressForMovieIDClosure: ((String) -> Double)?

    func loadWatchingProgressForMovieID(_ movieID: String) -> Double {
        loadWatchingProgressForMovieIDCallsCount += 1
        loadWatchingProgressForMovieIDReceivedMovieID = movieID
        return loadWatchingProgressForMovieIDClosure.map({ $0(movieID) }) ?? loadWatchingProgressForMovieIDReturnValue
    }

    // MARK: - setWatchingProgress

    var setWatchingProgressForCallsCount = 0
    var setWatchingProgressForCalled: Bool {
        return setWatchingProgressForCallsCount > 0
    }
    var setWatchingProgressForReceivedArguments: (watchingProgress: Double, movieID: String)?
    var setWatchingProgressForClosure: ((Double, String) -> Void)?

    func setWatchingProgress(_ watchingProgress: Double, for movieID: String) {
        setWatchingProgressForCallsCount += 1
        setWatchingProgressForReceivedArguments = (watchingProgress: watchingProgress, movieID: movieID)
        setWatchingProgressForClosure?(watchingProgress, movieID)
    }

}
