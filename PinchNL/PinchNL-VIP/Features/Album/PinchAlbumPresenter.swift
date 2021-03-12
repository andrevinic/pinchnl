//
//  PinchAlbumPresenter.swift
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

protocol PinchAlbumPresentationLogic {
    func presentAlbum(response: AlbumModels.Response)
    func presentPhotos()
}

class PinchAlbumPresenter: PinchAlbumPresentationLogic {
    
    weak var viewController: PinchAlbumDisplayLogic?
    
    // MARK: Do something
    
    func presentAlbum(response: AlbumModels.Response) {
        let viewModel = AlbumModels.ViewModel(albumList: response.albumList.compactMap {
            (
                id: String($0.id),
                title: $0.title
            )
        })
        viewController?.displayAlbum(viewModel: viewModel)
    }
    
    func presentPhotos() {
        viewController?.displayPhotos()
    }
}