//
//  DetailViewController.swift
//  MoviePlay
//
//  Created by tuyente on 10/2/18.
//  Copyright © 2018 tuyente. All rights reserved.
//

import UIKit
import Reusable
import youtube_ios_player_helper
import Cosmos

class DetailViewController: UIViewController, Reusable {
    @IBOutlet private weak var nameDetail: UILabel!
    @IBOutlet private weak var imageDetail: UIImageView!
    @IBOutlet private weak var likeButton: UIButton!
    @IBOutlet private weak var playVideoUiView: YTPlayerView!
    @IBOutlet private weak var nameTrailer: UILabel!
    @IBOutlet private weak var namePopularityLabel: UILabel!
    @IBOutlet private weak var starView: UIView!
    @IBOutlet private weak var imageError: UIImageView!
    
    private struct Constant {
        static let kMovie = "FavoriteMovies"
    }
    
    var movie = Movie()
    var arrayTrailer = [KeyTrailer]()
    
    func setContentForCell(move:Movie) {
        self.movie = move
    }
    
    func loadData() {
        let request = KeyTrailerRequest(id: movie.id)
        APIService.share.request(input: request) { [weak self] (response: KeyTrailerResponse?, error) in
            guard let `self` = self else { return }
            if let responseMovie = response, let keyTrailers = responseMovie.keyTrailers {
                self.arrayTrailer = keyTrailers
                if self.arrayTrailer.count > 0 {
                    DispatchQueue.main.async {
                        if let trailerMovie = self.arrayTrailer.first {
                            self.getTrailer(keyTrailer: trailerMovie)
                        }
                    }
                } else {
                    self.imageError.isHidden = false
                }
            }
        }
    }
    
    func checkFavourites() {
        guard let moviesData = UserDefaults.standard.data(forKey: Constant.kMovie) else {
            // if ko arraysmoview thi lan dau tie
            return
        }
        
        var moviesArray = [Movie]()
        do {
            try moviesArray = try! JSONDecoder().decode([Movie].self, from: moviesData)
        } catch let error as NSError {
            print(error)
        }
        for item in moviesArray {
            if item.id == self.movie.id {
                self.likeButton.setImage(#imageLiteral(resourceName: "heart"), for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindView()
        checkFavourites()
        loadData()
    }
    
    func bindView() {
        self.nameDetail.text = self.movie.title
        let url = URL(string: movie.getURLImage())
        self.imageDetail.kf.setImage(with: url)
        self.namePopularityLabel.text = "\(self.movie.popularity)"
    }
    
    private func getTrailer(keyTrailer: KeyTrailer ) {
        playVideoUiView.load(withVideoId: keyTrailer.key)
        nameTrailer.text = keyTrailer.name
    }
    
    @IBAction func clickSave(_ sender: Any) {
        let kMovie = "FavoriteMovies"
        guard let moviesData = UserDefaults.standard.data(forKey: kMovie) else {
            // if ko arraysmoview thi lan dau tienn
            self.likeButton.setImage(#imageLiteral(resourceName: "heart"), for: .normal)
            var moviesArray = [Movie]()
            moviesArray.append(self.movie)
            let kmovieData = try? JSONEncoder().encode(moviesArray)
            UserDefaults.standard.set(kmovieData, forKey: kMovie)
            return
        }
        // if co id thi thuc hien xoa movie trong mang va update arraymovie vao user defalt
        var moviesArray = [Movie]()
        do {
            try moviesArray = JSONDecoder().decode([Movie].self, from: moviesData)
        } catch let error as NSError {
            print(error)
        }
        for item in moviesArray {
            if item.id == self.movie.id {
                moviesArray = moviesArray.filter{$0 !== item}
                if let encoded = try? JSONEncoder().encode(moviesArray) {
                    UserDefaults.standard.set(encoded, forKey: kMovie)
                }
                self.likeButton.setImage(#imageLiteral(resourceName: "heart (1)"), for: .normal)
                return
            }
        }
        // if ko co thi thuc luu vao mang
        self.likeButton.setImage(#imageLiteral(resourceName: "heart"), for: .normal)
        moviesArray.append(self.movie)
        // thuc hien luu moviesArray vao userdefault
        if let encoded = try? JSONEncoder().encode(moviesArray) {
            UserDefaults.standard.set(encoded, forKey: kMovie)
        }
    }
}

extension DetailViewController: StoryboardSceneBased {
    static let sceneStoryboard = UIStoryboard(name: "Main", bundle: nil)
}

