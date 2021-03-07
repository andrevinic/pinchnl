//
//  AlbumViewController.swift
//  PinchNL-MVVM
//
//  Created by Andre Nogueira on 07/03/21.
//
import RxSwift
import RxCocoa
import UIKit

class AlbumViewController: BaseViewController {
    
    // MARK: - ViewModel
    private let viewModel: AlbumViewModelContract
    
    // MARK: - View
    private let _view: AlbumViewConfiguration
    
    // MARK: - Init
    init(view: AlbumViewConfiguration,
         viewModel: AlbumViewModelContract) {
        self.viewModel = viewModel
        self._view = view
        super.init()
    }
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        bindProperties()
    }
    
    private func configureView() {
        view = _view
        viewModel.requestAlbum()
    }
    
    private func bindProperties() {
        viewModel.albums.drive(self._view
                                .collectionView
                                .rx
                                .items(cellIdentifier: AlbumCollectionViewCell.className,
                                       cellType: AlbumCollectionViewCell.self)) { _, element, cell in
            cell.set(element.id)
        }.disposed(by: self.disposeBag)
    }
}

extension AlbumViewController: AlbumViewDelegate {
    
    func didTapAlbum() {
        
    }
    
}
