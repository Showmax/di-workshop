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
    let flow: MoviesListFlow

    func loadMovies() -> [MovieListItem] {
        return MoviesStore.shared.loadMovies().map { movie in
            let progress = WatchingProgressStore.shared.loadWatchingProgressForMovieID(movie.id)
            return MovieListItem(id: movie.id, title: movie.title, watchingProgress: String(format: "%.0f%%", progress*100))
        }
    }

    func didSelectMovie(_ movie: MovieListItem) {
        flow.playMovie(movie.id)
    }
}
