//
//  HomeViewController.swift
//  MoviePlay
//
//  Created by tuyente on 9/26/18.
//  Copyright © 2018 tuyente. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet private weak var myTable: UITableView!
    
    let array = [ListMovieType.nowPlaying, .popular, .topRated, .upcoming]
    var arrayResponse = [MovieResponse]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        loadData()
    }
    
    func setupTableView() {
        myTable.dataSource = self
        myTable.register(cellType: HomeTableViewCell.self)
    }
    
    func loadData() {
        var i = 0
        for type in array {
            let request = ListMovieRequest(url: type.url)
            APIService.share.request(input: request) { [weak self] (response: MovieResponse?, error) in
                guard let `self` = self else { return }
                if let responseMovie = response  {
                    self.arrayResponse.append(responseMovie)
                i += 1
                    if i == self.arrayResponse.count {
                        self.myTable.reloadData()
                    }
                }
            }
        }
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayResponse.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as HomeTableViewCell
        cell.setContentForCell(text: array[indexPath.row].name, tag: indexPath.row, viewController: self)
        return cell
    }
}

extension HomeViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayResponse[collectionView.tag].movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath) as HomeCollectionViewCell
        cell.setContentForCell(move: arrayResponse[collectionView.tag].movies[indexPath.row])
        return cell
    }
}

