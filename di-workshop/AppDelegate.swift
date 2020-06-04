//
//  AppDelegate.swift
//  test
//
//  Created by Showmax on 11/05/2020.
//  Copyright © 2020 Showmax. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var navigationController: UINavigationController?
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        navigationController = UINavigationController(rootViewController: makeMoviesList())
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }

    func makeMoviesList() -> UIViewController {
        let flow = MoviesListFlow(
            playMovie: { [weak self] movieID in
                guard let player = self?.makePlayerForMovie(movieID) else { return }
                self?.navigationController?.pushViewController(player, animated: true)
            }
        )
        let deps = MoviesListModel.Dependencies(
            movies: MoviesStoreImpl.shared,
            watchingProgress: WatchingProgressStoreImpl.shared
        )
        let model = MoviesListModel(deps: deps, flow: flow)
        return MoviesListViewController(model: model)
    }

    func makePlayerForMovie(_ movieID: String) -> UIViewController {
        let deps = PlayerModel.Dependencies(
            movies: MoviesStoreImpl.shared,
            watchingProgress: WatchingProgressStoreImpl.shared
        )
        let model = PlayerModel(deps: deps, movieID: movieID)
        return PlayerViewController(model: model)
    }
}

