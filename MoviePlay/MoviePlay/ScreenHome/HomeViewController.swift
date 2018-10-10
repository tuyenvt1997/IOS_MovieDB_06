//
//  HomeViewController.swift
//  MoviePlay
//
//  Created by tuyente on 9/26/18.
//  Copyright © 2018 tuyente. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet private weak var myTable: UITableView!
    @IBOutlet private weak var scrollImage: UIScrollView!
    
    let array: [ListMovieType] = [.nowPlaying, .popular, .topRated, .upcoming]
    var arrayResponse = [MovieResponse]()
    private let imagesPerPage: CGFloat = 1
    
    override func viewDidLoad() {
            setupTableView()
            loadData()
    }
    
    func loadScrollView() {
        scrollImage.isPagingEnabled = true
        scrollImage.contentSize = CGSize(width: self.view.bounds.width * CGFloat(arrayResponse[0].movies.count) / imagesPerPage, height: 128)
        scrollImage.showsHorizontalScrollIndicator = false
        
        let width = scrollImage.frame.size.width
        let height = scrollImage.frame.size.height
        var index = 0
        Timer.scheduledTimer(withTimeInterval: 6, repeats: true) { _ in
            if index == self.arrayResponse[0].movies.count - 1 {
                index = 0
            } else if Int(self.scrollImage.contentOffset.x / width) > index {
                index = Int(self.scrollImage.contentOffset.x / width) + 1
            } else {
                index += 1
            }
            
            self.scrollImage.scrollRectToVisible(CGRect(x: CGFloat(index)
                * width, y: 0, width: width, height: height), animated: true)
        }
    }
    
    func loadFeatures() {
        let width = scrollImage.frame.size.width / imagesPerPage
        let height = scrollImage.frame.size.height
        for (index , features) in arrayResponse[0].movies.enumerated() {
            let url = URL(string: features.getURLImageBackDrop())
            let imView = UIImageView()
            //Setup image position and image url
            imView.kf.setImage(with: url)
            scrollImage.addSubview(imView)
            imView.contentMode = .scaleAspectFill
            imView.frame = CGRect(x: CGFloat(index) * width, y: 0, width: width, height: height)
            
            //Add gesture for single image
            let ges = UITapGestureRecognizer(target: self, action: #selector(openImage(_ :)))
            imView.addGestureRecognizer(ges)
            imView.isUserInteractionEnabled = true
            //Store index into imView tag
            imView.tag = index
        }
    }
    
    @objc func openImage(_ ges: UITapGestureRecognizer) {
        guard let index = ges.view?.tag else {
            return
        }
        let detail = DetailViewController.instantiate()
        detail.movie = arrayResponse[0].movies[index]
        detail.setContentForCell(move: arrayResponse[0].movies[index])
        self.navigationController?.pushViewController(detail, animated: true)
    }
    
    private func setupTableView() {
        myTable.dataSource = self
        myTable.register(cellType: HomeTableViewCell.self)
    }
    
    func loadData() {
        var i = 0
        for type in array {
            let request = ListMovieRequest(url: type.url)
            APIService.share.request(input: request) { [weak self] (response: MovieResponse?, error) in
                guard let `self` = self else { return }
                if let responseMovie = response  {
                    self.arrayResponse.append(responseMovie)
                            i += 1
                    if i == self.arrayResponse.count {
                        DispatchQueue.main.async {
                            self.myTable.reloadData()
                            self.loadScrollView()
                            self.loadFeatures()
                        }
                    }
                }
            }
        }
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayResponse.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as HomeTableViewCell
        cell.setContentForCell(text: array[indexPath.row].name, tag: indexPath.row, viewController: self)
        cell.delegate = self
        return cell
    }
}

extension HomeViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayResponse[collectionView.tag].movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath) as HomeCollectionViewCell
        cell.setContentForCell(move: arrayResponse[collectionView.tag].movies[indexPath.row])
        cell.tag = indexPath.row
        return cell
    }
}

extension HomeViewController : HomeTableViewCellDelegate {
    func clickLoadAll(cell: HomeTableViewCell) {
        let loadMore = LoadMoreViewController.instantiate()
        loadMore.arrayLoadMore = arrayResponse[cell.getTag()].movies
        self.navigationController?.pushViewController(loadMore, animated: true)
    }
    
    func clickDetail(cell: HomeTableViewCell ,cellCollection: HomeCollectionViewCell) {
        let detail = DetailViewController.instantiate()
        detail.setContentForCell(move: arrayResponse[cell.getTag()].movies[cellCollection.tag])
        self.navigationController?.pushViewController(detail, animated: true)
    }
}

extension UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
}

