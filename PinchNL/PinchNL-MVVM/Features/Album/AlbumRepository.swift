//
//  AlbumRepository.swift
//  PinchNL-MVVM
//
//  Created by Andre Nogueira on 07/03/21.
//

import RxSwift

protocol AlbumRepositoryContract {
    func requestAlbum(page: Int) -> Single<[AlbumResponse]>
}
class AlbumRepository: AlbumRepositoryContract {
    
    let service: AlbumServiceContract
    
    // TODO: - ADD persistance manager
    
    init(service: AlbumServiceContract) {
        self.service = service
    }
    
    func requestAlbum(page: Int) -> Single<[AlbumResponse]> {
        return service.fetch(page: page)
    }
}
