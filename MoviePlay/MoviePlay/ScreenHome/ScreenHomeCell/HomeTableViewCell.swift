//
//  HomeTableViewCell.swift
//  MoviePlay
//
//  Created by tuyente on 9/26/18.
//  Copyright © 2018 tuyente. All rights reserved.
//

import UIKit
import Reusable

class HomeTableViewCell: UITableViewCell, NibReusable {

    @IBOutlet private weak var homeLabel: UILabel!
    @IBOutlet private weak var homeCollection: UICollectionView!
    
    func configview() {          
        homeCollection.register(cellType: HomeCollectionViewCell.self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configview()
    }
    
    func setContentForCell(text: String, tag: Int, viewController: UIViewController) {
        homeLabel.text = text
        homeCollection.tag = tag
        homeCollection.dataSource = viewController as? UICollectionViewDataSource
    }

}

