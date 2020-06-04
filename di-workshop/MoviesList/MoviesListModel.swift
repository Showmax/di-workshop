//
//  MasterViewController.swift
//  test
//
//  Created by Showmax on 11/05/2020.
//  Copyright © 2020 Showmax. All rights reserved.
//

import UIKit

struct MoviesListFlow {
    let playMovie: (String) -> ()
}

struct MovieListItem {
    let id: String
    let title: String
    let watchingProgress: String
}

struct MoviesListModel {
    struct Dependencies {
        let movies: MoviesStore
        let watchingProgress: WatchingProgressStore
    }

    let deps: Dependencies
    let flow: MoviesListFlow

    func loadMovies() -> [MovieListItem] {
        return deps.movies.loadMovies().map { movie in
            let progress = deps.watchingProgress.loadWatchingProgressForMovieID(movie.id)
            return MovieListItem(id: movie.id, title: movie.title, watchingProgress: String(format: "%.0f%%", progress*100))
        }
    }

    func didSelectMovie(_ movie: MovieListItem) {
        flow.playMovie(movie.id)
    }
}
