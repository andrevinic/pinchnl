//
//  PinchView.swift
//  PinchNL
//
//  Created by Andre Nogueira on 07/03/21.
//

import UIKit

protocol BaseView {
    
    func setupHierarchy()
    func setupConstraints()
    func setupConfigurations()
    
}

class PinchView: UIView, BaseView {

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented.")
    }
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = true
        setupView()
    }
    
    func setupView() {
        setupHierarchy()
        setupConstraints()
        setupConfigurations()
    }
    
    func setupConfigurations() {
        clipsToBounds = true
        backgroundColor = .green
    }
    
    func setupHierarchy() {
        
    }
    
    func setupConstraints() {
        
    }

}
