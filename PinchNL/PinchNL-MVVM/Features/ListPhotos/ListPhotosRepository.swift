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
    
    init(service: ListPhotosServiceContract) {
        self.service = service
    }
    
    func fetchPhotos(requestService: PhotosModels.RequestService.Photos) -> Single<[PhotoResponse]> {
        return service.photos(request: requestService)
    }
    
}
