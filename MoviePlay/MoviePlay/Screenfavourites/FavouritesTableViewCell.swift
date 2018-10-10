//
//  FavouritesTableViewCell.swift
//  MoviePlay
//
//  Created by tuyente on 10/4/18.
//  Copyright © 2018 tuyente. All rights reserved.
//

import UIKit
import Reusable

class FavouritesTableViewCell: UITableViewCell , Reusable{

    @IBOutlet private weak var imageFavourites: UIImageView!
    @IBOutlet private weak var nameFavourites: UILabel!
    @IBOutlet private weak var nameTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setContentForCell (movieFavourites: Movie) {
        nameFavourites.text = movieFavourites.title
        let url = URL(string: movieFavourites.getURLImage())
        imageFavourites.kf.setImage(with: url)
        nameTitle.text = "\(movieFavourites.popularity)"
    }
}
