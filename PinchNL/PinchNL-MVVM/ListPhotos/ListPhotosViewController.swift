//
//  ListPhotosViewController.swift
//  PinchNL-MVVM
//
//  Created by Andre Nogueira on 07/03/21.
//

import UIKit

class ListPhotosViewController: PinchViewController {

    private let viewModel: ListPhotosViewModelContract
    private let coordinator: Coordinator
    private let _view: PhotosViewConfiguration
    
    init(
        view: PhotosViewConfiguration,
        viewModel: ListPhotosViewModelContract,
        coordinator: Coordinator
    ) {
        self._view = view
        self.viewModel = viewModel
        self.coordinator = coordinator
        super.init()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        bindProperties()
    }
    
    private func configureView() {
        view = _view
        self._view.delegate = self
        requestPhotos()
    }
    private func requestPhotos() {
        self.viewModel.fetchListPhotos()
    }
    
    private func bindProperties() {
        viewModel.photos.drive(
            self._view
                .collectionView
                .rx
                .items(
                    cellIdentifier: PhotosCollectionViewCell.className,
                    cellType: PhotosCollectionViewCell.self
                )
        ) { _ , element, cell in
            cell.set(thumbnailUrl: element.thumbnailUrl, title: element.title)
        }.disposed(by: self.disposeBag)
       
    }
    
  
}

extension ListPhotosViewController: PhotosViewDelegate {
    
    func didTapPhoto() {
        
    }
    
}

extension ListPhotosViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        let height = width
        return CGSize(width: width, height: height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let bottomEdge = scrollView.contentOffset.y + scrollView.frame.size.height
        if bottomEdge > scrollView.contentSize.height {
//            requestAlbum()
        }
    }
}
