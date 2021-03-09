//
//  PhotosCollectionViewCell.swift
//  PinchNL
//
//  Created by Andre Nogueira on 08/03/21.
//

import UIKit

class PhotosCollectionViewCell: PinchCollectionViewCell {
    
    func set(thumbnailUrl: String, title: String) {
        self.titleLabel.text = title
        thumbnail.loadFrom(url: thumbnailUrl)
    }
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private lazy var thumbnail: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill

        return image
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.opaqueSeparator
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor.darkGray.cgColor
        view.layer.cornerRadius = 5
        return view
    }()
    
    override func setupHierarchy() {
        self.addSubview(containerView)
        [titleLabel, thumbnail].forEach { containerView.addSubview($0) }
        
    }
    
    override func setupConstraints() {
        NSLayoutConstraint.activate([
            
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            containerView.leftAnchor.constraint(equalTo: leftAnchor, constant: 5),
            containerView.rightAnchor.constraint(equalTo: rightAnchor, constant: -5),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 5),
            titleLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 5),
            titleLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -5),
            
            thumbnail.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            thumbnail.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 5),
            thumbnail.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -5),
            thumbnail.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -5)
        
        ])
    }
    
    override func setupConfigurations() {
        self.backgroundColor = .white
    }
}
