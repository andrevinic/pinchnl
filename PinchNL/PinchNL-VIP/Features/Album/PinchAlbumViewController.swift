//
//  PinchAlbumViewController.swift
//  PinchNL
//
//  Created by Andre Nogueira on 09/03/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol PinchAlbumDisplayLogic: AnyObject {
    func displayAlbum(viewModel: AlbumModels.ViewModel)
    func displayPhotos()
}

class PinchAlbumViewController: BaseViewController, PinchAlbumDisplayLogic {
    var interactor: PinchAlbumBusinessLogic?
    var router: (PinchAlbumRoutingLogic & PinchAlbumDataPassing)
    var _view: AlbumViewConfiguration
    var albumList:[(id: String, title: String)] = []
    
    // MARK: - Properties
    private var page = 1
    
    init(
        view: AlbumViewConfiguration,
        interactor: PinchAlbumBusinessLogic,
        router: (PinchAlbumRoutingLogic & PinchAlbumDataPassing)
    ) {
        self._view = view
        self.interactor = interactor
        self.router = router
        super.init()
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = _view
        _view.delegate = self
        _view.collectionView.dataSource = self
        requestAlbum()
    }
    
    // MARK: Do something
    
    func requestAlbum() {
        interactor?.requestAlbum(page: page)
    }
    
    func displayAlbum(viewModel: AlbumModels.ViewModel) {
        self.albumList = viewModel.albumList
        _view.reloadData()
        self.page += 1
    }
    
    func displayPhotos() {
        self.router.routeToPhotos()
    }
}

extension PinchAlbumViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return albumList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(with: AlbumCollectionViewCell.self, for: indexPath)
        if !self.albumList.isEmpty {
            let element = self.albumList[indexPath.row]
            cell.set(element.title)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let element = self.albumList[indexPath.row]
        self.interactor?.requestPhoto(page: page, albumId: element.id)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        let height = CGFloat(50)
        return CGSize(width: width, height: height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let bottomEdge = scrollView.contentOffset.y + scrollView.frame.size.height
        if bottomEdge > scrollView.contentSize.height {
            requestAlbum()
        }
    }
    
}

extension PinchAlbumViewController: AlbumViewDelegate {
    
    func didTapAlbum() {
        
    }
    
    func didTapRefresh() {
        self.requestAlbum()
    }
    
    
}
