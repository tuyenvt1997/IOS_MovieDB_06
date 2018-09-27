//
//  HomeCollectionViewCell.swift
//  MoviePlay
//
//  Created by tuyente on 9/26/18.
//  Copyright © 2018 tuyente. All rights reserved.
//

import UIKit
import Reusable
import Kingfisher

class HomeCollectionViewCell: UICollectionViewCell, NibReusable {

    @IBOutlet private weak var nameMovie: UILabel!
    @IBOutlet private weak var movieImage: UIImageView!
    
    override func awakeFromNib() {     
        super.awakeFromNib()
    }
    
    func setContentForCell(move:Movie) {
        nameMovie.text = move.title
        let url = URL(string: move.getURLImage())
        movieImage.kf.setImage(with: url)
    }
}

