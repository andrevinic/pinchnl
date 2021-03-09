//
//  AlbumView.swift
//  PinchNL
//
//  Created by Andre Nogueira on 07/03/21.
//

import UIKit

protocol AlbumViewDelegate: UICollectionViewDelegate {
    func didTapAlbum()
    func didTapRefresh()
}

protocol AlbumViewConfiguration: UIView {
    var collectionView: UICollectionView { get set }
    var delegate: AlbumViewDelegate? { get set }
    func configureView(viewModel: [AlbumModels.ViewModel])
    func endRefreshing()
}

class AlbumView: PinchView, AlbumViewConfiguration {
    
    private lazy var refreshControl: UIRefreshControl = {
        let refresh = UIRefreshControl()
        return refresh
    }()

    // MARK: - Delegate
    
    weak var delegate: AlbumViewDelegate? {
        didSet {
            collectionView.delegate = delegate
        }
    }
    
    func configureView(viewModel: [AlbumModels.ViewModel]) {
        
    }
    
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
        collectionView.register(cellType: AlbumCollectionViewCell.self)
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
