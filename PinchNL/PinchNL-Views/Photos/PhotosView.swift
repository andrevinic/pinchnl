//
//  PhotosView.swift
//  PinchNL
//
//  Created by Andre Nogueira on 08/03/21.
//

import UIKit

protocol PhotosViewDelegate: UICollectionViewDelegate {
    func didTapRefresh()
    func didTapPhoto()
}

protocol PhotosViewConfiguration: UIView {
    var collectionView: UICollectionView { get set }
    var delegate: PhotosViewDelegate? { get set }
    func endRefreshing()
}

class PhotosView: PinchView, PhotosViewConfiguration {
    
    weak var delegate: PhotosViewDelegate? {
        didSet {
            collectionView.delegate = delegate
        }
    }
    
    private lazy var refreshControl: UIRefreshControl = {
        let refresh = UIRefreshControl()
        return refresh
    }()
    
    lazy var collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.refreshControl = self.refreshControl
        return collectionView
    }()
    
    override func setupHierarchy() {
        self.addSubview(collectionView)
    }
    
    override func setupConfigurations() {
        backgroundColor = UIColor.white
        collectionView.register(cellType: PhotosCollectionViewCell.self)
        refreshControl.addTarget(self, action: #selector(tappedRefresh), for: .valueChanged)

    }
    
    override func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    @objc
    private func tappedRefresh() {
        delegate?.didTapRefresh()
    }
    
    func endRefreshing() {
        self.refreshControl.endRefreshing()
    }
}
