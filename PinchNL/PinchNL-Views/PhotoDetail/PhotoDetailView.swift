//
//  PhotoDetailView.swift
//  PinchNL-MVVM
//
//  Created by Andre Nogueira on 08/03/21.
//

import UIKit

protocol PhotoDetailViewConfiguration: UIView {
    func configureView(model: PhotosModels.ViewModel)
}

class PhotoDetailView: PinchView, PhotoDetailViewConfiguration, UIScrollViewDelegate {
    
    func configureView(model: PhotosModels.ViewModel) {
        imageView.loadFrom(url: model.url)
    }
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 6.0
        scrollView.delegate = self
        scrollView.alwaysBounceVertical = false
        scrollView.alwaysBounceHorizontal = false
        scrollView.showsVerticalScrollIndicator = true
        scrollView.flashScrollIndicators()

        return scrollView
    }()
    
    override func setupHierarchy() {
        self.addSubview(containerView)
        containerView.addSubview(scrollView)
        scrollView.addSubview(imageView)
    }
    
    override func setupConstraints() {
        NSLayoutConstraint.activate([
            
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leftAnchor.constraint(equalTo: leftAnchor),
            containerView.rightAnchor.constraint(equalTo: rightAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            scrollView.topAnchor.constraint(equalTo: containerView.topAnchor),
            scrollView.leftAnchor.constraint(equalTo: containerView.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: containerView.rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            
            imageView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            imageView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            imageView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
            imageView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            imageView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
            imageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),

        ])
    }
    
    override func setupConfigurations() {
        backgroundColor = UIColor.white
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
