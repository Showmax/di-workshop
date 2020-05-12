//
//  MasterViewController.swift
//  test
//
//  Created by Showmax on 11/05/2020.
//  Copyright © 2020 Showmax. All rights reserved.
//

import UIKit

class MoviesListViewController: UITableViewController {

    let model: MoviesListModel

    private var movies: [MovieListItem] = []

    init(model: MoviesListModel) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
        title = "Movies + My Watching Progress"
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(MovieListCell.self, forCellReuseIdentifier: "movie")
    }

    override func viewWillAppear(_ animated: Bool) {
        movies = model.loadMovies()
        tableView.reloadData()
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movie", for: indexPath)
        let movie = movies[indexPath.row]
        cell.textLabel?.text = movie.title
        cell.detailTextLabel?.text = movie.watchingProgress
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = movies[indexPath.row]
        model.didSelectMovie(movie)
    }
}

class MovieListCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)
        textLabel?.font = UIFont.preferredFont(forTextStyle: .title2)
        detailTextLabel?.textColor = .systemPink
        detailTextLabel?.font = UIFont.preferredFont(forTextStyle: .title2)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
