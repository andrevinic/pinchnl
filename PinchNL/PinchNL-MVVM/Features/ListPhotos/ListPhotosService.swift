//
//  ListPhotosService.swift
//  PinchNL-MVVM
//
//  Created by Andre Nogueira on 07/03/21.
//

import Moya
import RxSwift

protocol ListPhotosServiceContract {
    var provider: PinchAPIProvider<PinchAPI> { get set }
    func photos(request: PhotosModels.RequestService.Photos) -> Single<[PhotoResponse]>
}
class ListPhotosService: ListPhotosServiceContract {
    var provider: PinchAPIProvider<PinchAPI>
    
    init(provider: PinchAPIProvider<PinchAPI>) {
        self.provider = provider
    }
    
    func photos(request: PhotosModels.RequestService.Photos) -> Single<[PhotoResponse]> {
        return provider
            .rx
            .request(
                .photos(
                    albumId: request.albumId,
                    pagination: request.page
                )
            ).mapEntity([PhotoResponse].self)
    }
}
