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
    
    private let viewModel: AlbumViewModelContract
    
    init(viewModel: AlbumViewModelContract) {
        self.viewModel = viewModel
        super.init()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.requestAlbum()
        bindProperties()
    }
    
    private func bindProperties() {
//        viewModel.albums.drive
    }
}
