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
    func fetch(page: Int) -> Single<[AlbumResponse]>
}

class AlbumService: AlbumServiceContract {
    
    var provider: PinchAPIProvider<PinchAPI>
    
    init(apiProvider: PinchAPIProvider<PinchAPI>) {
        provider = apiProvider
    }
    
    func fetch(page: Int) -> Single<[AlbumResponse]> {
        return self.provider
            .rx
            .request(.album(page: page))
            .mapEntity([AlbumResponse].self)
    }
    
}

