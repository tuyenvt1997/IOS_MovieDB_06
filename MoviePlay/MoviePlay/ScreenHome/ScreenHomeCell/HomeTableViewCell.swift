//
//  HomeTableViewCell.swift
//  MoviePlay
//
//  Created by tuyente on 9/26/18.
//  Copyright © 2018 tuyente. All rights reserved.
//

import UIKit
import Reusable

protocol HomeTableViewCellDelegate: class {
    func clickLoadAll(cell: HomeTableViewCell)
    func clickDetail(cell: HomeTableViewCell, cellCollection: HomeCollectionViewCell )
}

class HomeTableViewCell: UITableViewCell, NibReusable  {

    @IBOutlet private weak var homeLabel: UILabel!
    @IBOutlet private weak var homeCollection: UICollectionView!
    
    weak var delegate: HomeTableViewCellDelegate?

    func configview() {          
        homeCollection.register(cellType: HomeCollectionViewCell.self)
        homeCollection.delegate = self
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
    
    func getTag() -> Int {
        return homeCollection.tag
    }
    
    @IBAction func handleLoadMoreAction(_ sender: Any) {
        delegate?.clickLoadAll(cell: self)
    }
}

extension HomeTableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.dequeueReusableCell(for: indexPath) as HomeCollectionViewCell
        delegate?.clickDetail(cell: self, cellCollection: cell)
        print(indexPath.row)
    }
}
