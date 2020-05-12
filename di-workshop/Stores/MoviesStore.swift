//
//  MasterViewController.swift
//  test
//
//  Created by Showmax on 11/05/2020.
//  Copyright © 2020 Showmax. All rights reserved.
//

import UIKit

class MoviesStore {

    static let shared = MoviesStore()

    private lazy var movies: [Movie] = {
        let url = URL(string: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4")!
        return [
            Movie(id: "1", title: "Jason Bourne", url: url),
            Movie(id: "2", title: "Shrek", url: url),
            Movie(id: "3", title: "Rick and Morty", url: url),
            Movie(id: "4", title: "Ramy", url: url),
            Movie(id: "5", title: "Brooklyn Nine-Nine", url: url),
            Movie(id: "6", title: "Downton Abbey", url: url),
            Movie(id: "7", title: "Watchmen", url: url),
            Movie(id: "8", title: "Younger", url: url),
            Movie(id: "9", title: "Godfather of Harlem", url: url),
            Movie(id: "10", title: "The River", url: url),
            Movie(id: "11", title: "Paddington", url: url)
        ].sorted { $0.title < $1.title }
    }()

    func loadMovies() -> [Movie] {
        return movies
    }

    func movieByID(_ id: String) -> Movie? {
        return movies.first { $0.id == id }
    }
}

