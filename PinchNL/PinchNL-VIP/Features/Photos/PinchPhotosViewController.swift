//
//  PinchPhotosViewController.swift
//  PinchNL
//
//  Created by Andre Nogueira on 11/03/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import Foundation

protocol PinchPhotosDisplayLogic: AnyObject {
    func displayPhotos(viewModel: PhotosModels.ViewModel)
}

class PinchPhotosViewController: BaseViewController, PinchPhotosDisplayLogic {
    var interactor: PinchPhotosBusinessLogic
    var router: (PinchPhotosRoutingLogic & PinchPhotosDataPassing)
    var _view: PhotosViewConfiguration
    
    var photosList: [(title: String, url: String, thumbnailUrl: String)] = []
    
    init(
        view: PhotosViewConfiguration,
        interactor: PinchPhotosBusinessLogic,
        router: (PinchPhotosRoutingLogic & PinchPhotosDataPassing)
    ) {
        self._view = view
        self.interactor = interactor
        self.router = router
        super.init()
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = _view
        _view.delegate = self
        _view.collectionView.dataSource = self
        self.title = "Photos"
        interactor.requestPhotos()
    }
    
    func displayPhotos(viewModel: PhotosModels.ViewModel) {
        self.photosList = viewModel.list
        self._view.collectionView.reloadData()
    }
    
}

extension PinchPhotosViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        let height = width
        return CGSize(width: width, height: height)
    }
}

extension PinchPhotosViewController: PhotosViewDelegate {
    
    func didTapPhoto() {
        
    }
    
    func didTapRefresh() {
        
    }
}

extension PinchPhotosViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photosList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(with: PhotosCollectionViewCell.self, for: indexPath)
        let element = self.photosList[indexPath.row]
        cell.set(
            thumbnailUrl: element.thumbnailUrl,
            title: element.title
        )
        return cell
    }
    
    
}
