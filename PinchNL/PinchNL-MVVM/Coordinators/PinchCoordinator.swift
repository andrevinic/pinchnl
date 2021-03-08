//
//  PinchCoordinator.swift
//  PinchNL
//
//  Created by Andre Nogueira on 07/03/21.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get set }
    func startAlbum()
    func startPhotos(model: AlbumModels.ViewModel, page: Int)
}

class PinchCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func startAlbum() {
        let provider = PinchAPIProvider<PinchAPI>()
        let service = AlbumService(apiProvider: provider)
        let repository = AlbumRepository(service: service)
        let viewModel = AlbumViewModel(repository: repository)
        let view = AlbumView()
        let viewController = AlbumViewController(
            view: view,
            viewModel: viewModel,
            coordinator: self
        )
        navigationController.pushViewController(viewController, animated: false)
    }
    
    func startPhotos(model: AlbumModels.ViewModel, page: Int) {
        let provider = PinchAPIProvider<PinchAPI>()
        let service = ListPhotosService(provider: provider)
        let repository = ListPhotosRepository(service: service)
        let requestService = PhotosModels.RequestService.Photos(
            page: page,
            albumId: Int(model.id) ?? 0
        )
        let viewModel = ListPhotosViewModel(
            repository: repository,
            requestService: requestService
        )
        let view = PhotosView()
        let viewController = ListPhotosViewController(
            view: view,
            viewModel: viewModel,
            coordinator: self
        )
        navigationController.pushViewController(viewController, animated: false)
        
    }
}
