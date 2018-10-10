//
//  LoadMoreViewController.swift
//  MoviePlay
//
//  Created by tuyente on 9/28/18.
//  Copyright © 2018 tuyente. All rights reserved.
//

import UIKit
import Kingfisher
import Reusable

class LoadMoreViewController: UIViewController, Reusable {
    @IBOutlet private weak var collection: UICollectionView!
    
    var arrayLoadMore = [Movie]()
    
    private func configView() {
        collection.dataSource = self
        collection.delegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
}

extension LoadMoreViewController: UICollectionViewDataSource, NibLoadable , UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayLoadMore.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath) as LoadCollectionViewCell
        cell.setContentForCell(move: arrayLoadMore[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailViewController = DetailViewController.instantiate()
        detailViewController.setContentForCell(move: arrayLoadMore[indexPath.row])
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
}
extension LoadMoreViewController: StoryboardSceneBased {
    static let sceneStoryboard = UIStoryboard(name: "Main", bundle: nil)
}
