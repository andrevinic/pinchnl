//
//  AlbumService.swift
//  PinchNL-MVVM
//
//  Created by Andre Nogueira on 07/03/21.
//

import Moya
import RxSwift

protocol AlbumServiceContract {
    var provider: PinchAPIProvider<PinchAPI> { get set }
    func fetch() -> Single<[AlbumResponse]>
}

class AlbumService: AlbumServiceContract {
    
    var provider: PinchAPIProvider<PinchAPI>
    
    init(apiProvider: PinchAPIProvider<PinchAPI>) {
        provider = apiProvider
    }
    
    func fetch() -> Single<[AlbumResponse]> {
        return self.provider
            .rx
            .request(.album)
            .mapEntity([AlbumResponse].self)
    }
    
}

