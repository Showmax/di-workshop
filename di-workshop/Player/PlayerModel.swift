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
    let movieID: String

    private(set) var state: PlayerState = .loading

    init(movieID: String) {
        self.movieID = movieID
    }

    func loadState() {
        guard let movie = MoviesStore.shared.movieByID(movieID) else { return }
        let progress = WatchingProgressStore.shared.loadWatchingProgressForMovieID(movieID)
        state = .loaded(movie.title, movie.url, progress)
    }

    func rememberWatchingProgress(_ progress: Double) {
        WatchingProgressStore.shared.setWatchingProgress(progress, for: movieID)
    }
}
