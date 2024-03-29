//
//  PinchPhotosPresenter.swift
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

protocol PinchPhotosPresentationLogic {
    func presentPhotos(response: PhotosModels.Response)
}

class PinchPhotosPresenter: PinchPhotosPresentationLogic {
    weak var viewController: PinchPhotosDisplayLogic?
    
    // MARK: Present photos
    
    func presentPhotos(response: PhotosModels.Response) {
        let viewModel = PhotosModels.ViewModel(list: response.list.compactMap {
            (
                title: $0.title,
                url: $0.url,
                thumbnailUrl: $0.thumbnailUrl
            )
            
        })
        viewController?.displayPhotos(viewModel: viewModel)
    }

}
