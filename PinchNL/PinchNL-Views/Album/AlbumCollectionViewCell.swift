//
//  AlbumCollectionViewCell.swift
//  PinchNL
//
//  Created by Andre Nogueira on 07/03/21.
//

import UIKit

class AlbumCollectionViewCell: PinchCollectionViewCell {
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.opaqueSeparator
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor.darkGray.cgColor
        view.layer.cornerRadius = 5
        return view
    }()

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
        addSubview(containerView)
        containerView.addSubview(albumLabel)
    }
    
    override func setupConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            containerView.leftAnchor.constraint(equalTo: leftAnchor, constant: 5),
            containerView.rightAnchor.constraint(equalTo: rightAnchor, constant: -5),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            
            albumLabel.topAnchor.constraint(equalTo: containerView.topAnchor),
            albumLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor),
            albumLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor),
            albumLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
    }
}
