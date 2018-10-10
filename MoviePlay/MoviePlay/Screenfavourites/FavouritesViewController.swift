//
//  FavouritesViewController.swift
//  MoviePlay
//
//  Created by tuyente on 10/4/18.
//  Copyright © 2018 tuyente. All rights reserved.
//

import UIKit
import Reusable

class FavouritesViewController: UIViewController {
    
    @IBOutlet private weak var myFavourites: UITableView!
    
    var favouritesMovieArray = [Movie]()
    
    private func setup() {
        myFavourites.dataSource = self
        myFavourites.delegate = self
    }
    
    func loadData(){
        let kMovie = "FavoriteMovies"
        guard let getArrayMovies =  UserDefaults.standard.data(forKey: kMovie) else {
            return
        }
        favouritesMovieArray = try! JSONDecoder().decode([Movie].self, from: getArrayMovies)
        self.myFavourites.reloadData()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

extension FavouritesViewController: UITableViewDataSource , UITableViewDelegate  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favouritesMovieArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as FavouritesTableViewCell
        cell.setContentForCell(movieFavourites: favouritesMovieArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detail = DetailViewController.instantiate()
        detail.setContentForCell(move: self.favouritesMovieArray[indexPath.row])
        self.navigationController?.pushViewController(detail, animated: true)
    }
}

extension FavouritesViewController : StoryboardSceneBased {
    static let sceneStoryboard = UIStoryboard(name: "Main", bundle: nil)
}
