//
//  AlbumCollectionViewCell.swift
//  PinchNL
//
//  Created by Andre Nogueira on 07/03/21.
//

import UIKit

class AlbumCollectionViewCell: PinchCollectionViewCell {
    
    private lazy var albumLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints  = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    func set(_ title: String) {
        albumLabel.text = title
    }
    
    override func setupConfigurations() {
        backgroundColor = .white
    }
    
    override func setupHierarchy() {
        addSubview(albumLabel)
    }
    
    override func setupConstraints() {
        NSLayoutConstraint.activate([
            albumLabel.topAnchor.constraint(equalTo: topAnchor),
            albumLabel.leftAnchor.constraint(equalTo: leftAnchor),
            albumLabel.rightAnchor.constraint(equalTo: rightAnchor),
            albumLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
