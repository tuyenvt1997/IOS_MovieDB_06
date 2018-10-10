//
//  SearchTableViewCell.swift
//  MoviePlay
//
//  Created by tuyente on 10/3/18.
//  Copyright © 2018 tuyente. All rights reserved.
//

import UIKit
import Reusable

class SearchTableViewCell: UITableViewCell, Reusable {
    
    @IBOutlet private weak var nameSearch: UILabel!
    @IBOutlet private weak var imageSearch: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func congfigView (movie: Movie) {
        nameSearch.text =  movie.title
        let url = URL(string: movie.getURLImage())
        imageSearch.kf.setImage(with: url)
    }
}
