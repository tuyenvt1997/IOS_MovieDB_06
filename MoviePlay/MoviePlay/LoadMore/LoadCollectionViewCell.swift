//
//  LoadCollectionViewCell.swift
//  MoviePlay
//
//  Created by tuyente on 9/28/18.
//  Copyright © 2018 tuyente. All rights reserved.
//

import UIKit
import Reusable

class LoadCollectionViewCell: UICollectionViewCell, Reusable {
    
    @IBOutlet private weak var nameAll: UILabel!
    @IBOutlet private weak var imageAll: UIImageView!
    
    func setContentForCell(move:Movie) {
        nameAll.text = move.title
        let url = URL(string: move.getURLImage())
        imageAll.kf.setImage(with: url, completionHandler: {
            (image, error, cacheType, imageUrl) in
            let placeholder = UILabel()
            placeholder.text = "Image could not be downloaded"
            self.imageAll.kf.setImage(with: url, placeholder:nil, options: nil, progressBlock: nil, completionHandler: nil)
        })
    }
}
