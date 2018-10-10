//
//  SearchViewController.swift
//  MoviePlay
//
//  Created by tuyente on 10/3/18.
//  Copyright © 2018 tuyente. All rights reserved.
//

import UIKit
import Reusable

class SearchViewController: UIViewController, UISearchBarDelegate, Reusable {

    @IBOutlet private weak var mySearchBar: UISearchBar!
    @IBOutlet private weak var myTableSearch: UITableView!
    var timer: Timer?
    var movies = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearch()
    }
    
    func setupSearch() {
        myTableSearch.delegate = self
        myTableSearch.dataSource = self
        mySearchBar.delegate = self
        mySearchBar.returnKeyType = .done
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        myTableSearch.isUserInteractionEnabled = false
        if timer != nil {
            timer?.invalidate()
        }
        guard let text = searchBar.text else {
            self.movies = [Movie]()
            self.myTableSearch.reloadData()
            return
        }
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { _ in
            self.movies = [Movie]()
            self.myTableSearch.reloadData()
            self.myTableSearch.isUserInteractionEnabled = true
            self.loadData(query: text)
        }
    }
    
    private func loadData(query: String) {
        let request = GetSearchListRequest( query: query, page: 1)
        APIService.share.request(input: request) { [weak self] (response: MovieResponse?, error) in
            guard let `self` = self else { return }
            if let responseMoviee = response  {
                self.movies = responseMoviee.movies
                self.myTableSearch.reloadData()
            }
        }
    }
}

extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as SearchTableViewCell
        cell.congfigView(movie: movies[indexPath.row])
        cell.tag = indexPath.row
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detail = DetailViewController.instantiate()
        detail.setContentForCell(move: self.movies[indexPath.row])
        self.navigationController?.pushViewController(detail, animated: true)
    }
}

extension SearchViewController: StoryboardSceneBased {
    static let sceneStoryboard = UIStoryboard(name: "Main", bundle: nil)
}
