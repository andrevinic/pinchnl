//
//  PinchCollectionViewCell.swift
//  PinchNL
//
//  Created by Andre Nogueira on 07/03/21.
//

import UIKit

class PinchCollectionViewCell: UICollectionViewCell, BaseView {
    
    func setupHierarchy() {
        
    }
    
    func setupConstraints() {
        translatesAutoresizingMaskIntoConstraints = true
    }
    
    func setupConfigurations() {
        clipsToBounds = true
    }
    
    @available(*, unavailable)
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = true
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("This object should not be used on Interface Builder")
    }
    
    func setupView() {
        setupHierarchy()
        setupConstraints()
        setupConfigurations()
    }
    
}
