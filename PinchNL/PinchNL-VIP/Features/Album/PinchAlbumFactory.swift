//
//  PinchAlbumFactory.swift
//  PinchNL-VIP
//
//  Created by Andre Nogueira on 09/03/21.
//

import Foundation

struct PinchAlbumFactory {
    
    func setup() -> PinchAlbumViewController {
        let view = AlbumView()
        let presenter = PinchAlbumPresenter()
        let provider = PinchAPIProvider<PinchAPI>()
        let worker = PinchAlbumWorker(provider: provider)
        let interactor = PinchAlbumInteractor(presenter: presenter, worker: worker)
        let router = PinchAlbumRouter(dataStore: interactor)
        let viewController = PinchAlbumViewController(view: view, interactor: interactor, router: router)
        presenter.viewController = viewController
        router.viewController = viewController
        return viewController
    }
}
