//
//  ListPhotosViewController.swift
//  PinchNL-MVVM
//
//  Created by Andre Nogueira on 07/03/21.
//

import UIKit

class ListPhotosViewController: PinchViewController {
    
    private var choosedPhoto: PhotosModels.ViewModel?

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
        
        self._view.collectionView
            .rx
            .modelSelected(PhotosModels.ViewModel.self)
            .subscribe (
                onNext: { [weak self] (response) in
                    self?.choosedPhoto = response
                    self?.didTapPhoto()
                }
            ).disposed(by: self.disposeBag)
        
        self.viewModel
            .refresh
            .asObservable()
            .subscribe(onNext: { (_) in
                self._view.endRefreshing()
            })
            .disposed(by: disposeBag)
    }
}

extension ListPhotosViewController: PhotosViewDelegate {
    
    func didTapPhoto() {
        guard let model = choosedPhoto else { return }
        self.coordinator.startPhotoDetail(model: model)
    }
    
    func didTapRefresh() {
        self.viewModel.refreshPhotosList()
    }
    
}

extension ListPhotosViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        let height = width
        return CGSize(width: width, height: height)
    }
}
