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
    
    // MARK: - Properties
    private var page = 1
    
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
        self._view.delegate = self
        viewModel.requestAlbum(page: page)
        page += 1
    }
    
    private func bindProperties() {
        viewModel.albums.drive(self._view
                                .collectionView
                                .rx
                                .items(cellIdentifier: AlbumCollectionViewCell.className,
                                       cellType: AlbumCollectionViewCell.self)) { _, element, cell in
            cell.set(element.title)
        }.disposed(by: self.disposeBag)
        
        self._view.collectionView
            .rx
            .modelSelected(AlbumModels.ViewModel.self)
            .subscribe (onNext: { (response) in
                print(response.title)
            }).disposed(by: self.disposeBag)
        
    }
}

extension AlbumViewController: AlbumViewDelegate {
    
    func didTapAlbum() {
        
    }
}

extension AlbumViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        let height = CGFloat(50)
        return CGSize(width: width, height: height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let bottomEdge = scrollView.contentOffset.y + scrollView.frame.size.height
        if bottomEdge > scrollView.contentSize.height {
            self.viewModel.requestAlbum(page: page)
            page += 1
        }
    }
}
