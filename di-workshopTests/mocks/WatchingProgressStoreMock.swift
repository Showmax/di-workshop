import XCTest
@testable import di_workshop

class WatchingProgressStoreMock: WatchingProgressStore {

    var loadWatchingProgressForMovieIDReturnValue: Double!
    func loadWatchingProgressForMovieID(_ movieID: String) -> Double {
        return loadWatchingProgressForMovieIDReturnValue
    }

    var setWatchingProgressGivenValue: Double?
    var setWatchingProgressGivenID: String?
    func setWatchingProgress(_ watchingProgress: Double, for movieID: String) {
        setWatchingProgressGivenValue = watchingProgress
        setWatchingProgressGivenID = movieID
    }
}

/// PROBLEM 3
/// - hard to manage
/// - boilerplate code, not used in production
/// - on each change you have to write similar setters again and again

