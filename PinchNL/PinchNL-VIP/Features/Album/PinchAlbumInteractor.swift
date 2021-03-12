//
//  PinchAlbumInteractor.swift
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

protocol PinchAlbumBusinessLogic {
    func requestAlbum(page: Int)
    func requestPhoto(page: Int, albumId: String)
}

protocol PinchAlbumDataStore {
    var albumData:AlbumModels.AlbumData? { get set }
    var photoData:PhotosModels.PhotosData? { get set }
}

class PinchAlbumInteractor: PinchAlbumBusinessLogic, PinchAlbumDataStore {
    
    private let presenter: PinchAlbumPresentationLogic
    private let worker: PinchAlbumWorkerLogic
    var albumData:AlbumModels.AlbumData?
    var photoData:PhotosModels.PhotosData?
    
    init(
        presenter:PinchAlbumPresentationLogic,
        worker: PinchAlbumWorkerLogic
    ) {
        self.presenter = presenter
        self.worker = worker
    }
    
    // MARK: Request Album
    
    func requestAlbum(page: Int) {
        
        worker.requestAlbum(page: page) { [weak self] (result) in
            switch result {
            
            case .success(let albumData):
                self?.albumData = albumData
                self?.presenter.presentAlbum(
                    response: AlbumModels.Response(
                        albumList: albumData.list.compactMap {
                            (
                                id: $0.id,
                                title: $0.title
                            )
                        })
                )
            case .failure(let error):
                self?.presenter.presentAlbumError(response: AlbumModels.AlbumError(error: error))
            }
        }
    }
    
    func requestPhoto(page: Int, albumId: String) {
        let request = PhotosModels.RequestService.Photos(page: page, albumId: Int(albumId) ?? 0)
        self.worker.requestPhotoList(requestService: request) { [weak self] (result) in
            switch result {
            case .success(let photoData):
                self?.photoData = photoData
                self?.presenter.presentPhotos()
            case .failure(let error):
                self?.presenter.presentPhotosError(response: PhotosModels.PhotosError(error: error))
            }
        }
    }
}
