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
    
    private let service: AlbumServiceContract
    private let realmManager: RealmManagerContract
    
    init(
        service: AlbumServiceContract,
        realmManager: RealmManagerContract
    ) {
        self.service = service
        self.realmManager = realmManager
    }
    
    func requestAlbum(page: Int) -> Single<[AlbumResponse]> {
        if Reachability.isConnectedToNetwork() {
            return service.fetch(page: page)
                .do (
                    onSuccess: { [weak self] (response) in
                        self?.realmManager.storeAlbumModels(
                            response: response,
                            page: page
                        )
                    })
        } else {
            return Single.just(
                realmManager.getAlbumModels(page: page)
            )
        }
    }
}
