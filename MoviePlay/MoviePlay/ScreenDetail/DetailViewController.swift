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

class DetailViewController: UIViewController, Reusable {
    @IBOutlet private weak var nameDetail: UILabel!
    @IBOutlet private weak var imageDetail: UIImageView!
    @IBOutlet private weak var playVideoUIView: YTPlayerView!
    @IBOutlet private weak var nameTrailer: UILabel!
    
    var movie = Movie()
    var arrayTrailer = [KeyTrailer]()
    
    func setContentForCell(move:Movie) {
        self.movie = move
    }
    
    private func loadData() {
        let request = KeyTrailerRequest(id: movie.id)
        APIService.share.request(input: request) { [weak self] (response: KeyTrailerResponse?, error) in
            guard let `self` = self else { return }
            if let responseMovie = response, let keyTrailers = responseMovie.keyTrailers {
                self.arrayTrailer = keyTrailers
                DispatchQueue.main.async {
                    if let trailerMovie = self.arrayTrailer.first {
                        self.getTrailer(keyTrailer: trailerMovie)
                    }
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindView()
        loadData()
    }
    
   private func bindView() {
        self.nameDetail.text = self.movie.title
        let url = URL(string: movie.getURLImage())
        self.imageDetail.kf.setImage(with: url)
    }
    
    private func getTrailer(keyTrailer: KeyTrailer ) {
        playVideoUIView.load(withVideoId: keyTrailer.key)
        nameTrailer.text = keyTrailer.name
    }
}

extension DetailViewController: StoryboardSceneBased {
    static let sceneStoryboard = UIStoryboard(name: "Main", bundle: nil)
}
