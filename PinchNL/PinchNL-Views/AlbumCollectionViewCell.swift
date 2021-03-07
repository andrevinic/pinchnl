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
        return label
    }()
    
    func set(_ id: String) {
        albumLabel.text = id
    }
}
