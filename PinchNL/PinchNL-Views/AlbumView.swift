//
//  AlbumView.swift
//  PinchNL
//
//  Created by Andre Nogueira on 07/03/21.
//

import UIKit

protocol AlbumViewDelegate: UICollectionViewDelegate {
    func didTapAlbum()
}

protocol AlbumViewConfiguration: UIView {
    var collectionView: UICollectionView { get set }
    var delegate:AlbumViewDelegate? { get set }
    func configureView(viewModel: [AlbumModels.ViewModel])
    func didSelectAnAlbum()
}

class AlbumView: PinchView {
    
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
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(cellTypes: [PinchCollectionViewCell.self])
        return collectionView
    }()
    
    override func setupHierarchy() {
        self.addSubview(collectionView)
    }
    
    override func setupConfigurations() {
        
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

extension AlbumView: AlbumViewConfiguration {
   
    func didSelectAnAlbum() {
        
    }

}
