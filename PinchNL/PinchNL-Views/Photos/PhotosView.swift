//
//  PhotosView.swift
//  PinchNL
//
//  Created by Andre Nogueira on 08/03/21.
//

import UIKit

protocol PhotosViewDelegate: UICollectionViewDelegate {
    func didTapPhoto()
}

protocol PhotosViewConfiguration: UIView {
    var collectionView: UICollectionView { get set }
    var delegate: PhotosViewDelegate? { get set }
    func configureView()
}

class PhotosView: PinchView, PhotosViewConfiguration {
    
    func configureView() {
        
    }
    
    weak var delegate: PhotosViewDelegate? {
        didSet {
            collectionView.delegate = delegate
        }
    }
    
    lazy var collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override func setupHierarchy() {
        self.addSubview(collectionView)
    }
    
    override func setupConfigurations() {
        backgroundColor = UIColor.white
        collectionView.register(cellType: PhotosCollectionViewCell.self)
    }
    
    override func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
