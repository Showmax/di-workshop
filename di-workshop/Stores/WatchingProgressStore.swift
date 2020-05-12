//
//  MasterViewController.swift
//  test
//
//  Created by Showmax on 11/05/2020.
//  Copyright © 2020 Showmax. All rights reserved.
//

import UIKit

class WatchingProgressStore {

    static let shared = WatchingProgressStore()

    var storage: [String: Double] = [:]

    func loadWatchingProgressForMovieID(_ movieID: String) -> Double {
        return storage[movieID] ?? 0
    }

    func setWatchingProgress(_ watchingProgress: Double, for movieID: String) {
        storage[movieID] = watchingProgress
    }
}

