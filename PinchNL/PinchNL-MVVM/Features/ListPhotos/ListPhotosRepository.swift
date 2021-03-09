//
//  ListPhotosRepository.swift
//  PinchNL-MVVM
//
//  Created by Andre Nogueira on 07/03/21.
//

import RxSwift

protocol ListPhotosRepositoryContract {
    func fetchPhotos(requestService: PhotosModels.RequestService.Photos) -> Single<[PhotoResponse]>
}

class ListPhotosRepository: ListPhotosRepositoryContract {
    
    private let service: ListPhotosServiceContract
    private let realmManager: RealmManagerContract
    
    init(
        service: ListPhotosServiceContract,
        realmManager: RealmManagerContract
    ) {
        self.service = service
        self.realmManager = realmManager
    }
    
    func fetchPhotos(requestService: PhotosModels.RequestService.Photos) -> Single<[PhotoResponse]> {
        if Reachability.isConnectedToNetwork() {
            return service.photos(request: requestService)
        } else {
            return service.photos(request: requestService)
        }
        
        
    }
    
}
