//
//  PinchPhotosInteractor.swift
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

protocol PinchPhotosBusinessLogic {
    func requestPhotos()
}

protocol PinchPhotosDataStore {
    var photoData:PhotosModels.PhotosData? { get set }
}

class PinchPhotosInteractor: PinchPhotosBusinessLogic, PinchPhotosDataStore {
    
    private let presenter: PinchPhotosPresentationLogic
    var photoData:PhotosModels.PhotosData?
    
    init(presenter: PinchPhotosPresentationLogic) {
        self.presenter = presenter
    }
    
    // MARK: Request photos from data store
    
    func requestPhotos() {
        guard let photoData = photoData else { return }
        let response = PhotosModels.Response(
            list: photoData.data.compactMap {
                (
                    title: $0.title,
                    url: $0.url,
                    thumbnailUrl: $0.thumbnailUrl
                )
            })
        presenter.presentPhotos(response: response)
    }
}
