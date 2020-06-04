//
//  MasterViewController.swift
//  test
//
//  Created by Showmax on 11/05/2020.
//  Copyright © 2020 Showmax. All rights reserved.
//

import UIKit
import AVKit

enum PlayerState {
    typealias Title = String
    typealias Progress = Double
    case loading
    case loaded(Title, URL, Progress)
}

class PlayerModel {
    struct Dependencies {
        let movies: MoviesStore
        let watchingProgress: WatchingProgressStore
    }

    let deps: Dependencies
    let movieID: String

    private(set) var state: PlayerState = .loading

    init(deps: Dependencies, movieID: String) {
        self.deps = deps
        self.movieID = movieID
    }

    func loadState() {
        guard let movie = deps.movies.movieByID(movieID) else { return }
        let progress = deps.watchingProgress.loadWatchingProgressForMovieID(movieID)
        state = .loaded(movie.title, movie.url, progress)
    }

    func rememberWatchingProgress(_ progress: Double) {
        deps.watchingProgress.setWatchingProgress(progress, for: movieID)
    }
}
