//
//  AlbumRepository.swift
//  PinchNL-MVVM
//
//  Created by Andre Nogueira on 07/03/21.
//

import RxSwift

protocol AlbumRepositoryContract {
    func requestAlbum() -> Single<[AlbumResponse]>
}
class AlbumRepository: AlbumRepositoryContract {
    
    let service: AlbumServiceContract
    
    // TODO: - ADD persistance manager
    
    init(service: AlbumServiceContract) {
        self.service = service
    }
    
    func requestAlbum() -> Single<[AlbumResponse]> {
        return service.fetch()
    }
}
