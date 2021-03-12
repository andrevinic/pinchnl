//
//  PinchPhotosFactory.swift
//  PinchNL-VIP
//
//  Created by Andre Nogueira on 11/03/21.
//

import Foundation

struct PinchPhotosFactory {
    func setup() -> PinchPhotosViewController {
        let view = PhotosView()
        let presenter = PinchPhotosPresenter()
        let interactor = PinchPhotosInteractor(presenter: presenter)
        let router = PinchPhotosRouter(dataStore: interactor)
        let viewController = PinchPhotosViewController(
            view: view,
            interactor: interactor,
            router: router
        )
        presenter.viewController = viewController
        router.viewController = viewController
        return viewController
    }
}
