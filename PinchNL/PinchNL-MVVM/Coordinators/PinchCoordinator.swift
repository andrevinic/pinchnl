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
    func startPhotos(model: AlbumModels.ViewData, page: Int)
    func startPhotoDetail(model: PhotosModels.ViewData)
}

class PinchCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func startAlbum() {
        let provider = PinchAPIProvider<PinchAPI>()
        let service = AlbumService(apiProvider: provider)
        let realm = RealmManager()
        let repository = AlbumRepository(
            service: service,
            realmManager: realm
        )
        let viewModel = AlbumViewModel(repository: repository)
        let view = AlbumView()
        let viewController = AlbumViewController(
            view: view,
            viewModel: viewModel,
            coordinator: self
        )
        navigationController.pushViewController(viewController, animated: false)
    }
    
    func startPhotos(model: AlbumModels.ViewData, page: Int) {
        let provider = PinchAPIProvider<PinchAPI>()
        let service = ListPhotosService(provider: provider)
        let realmManager = RealmManager()
        let repository = ListPhotosRepository(
            service: service,
            realmManager: realmManager
        )
        
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
    
    func startPhotoDetail(model: PhotosModels.ViewData) {
        let viewModel = PhotoDetailViewModel(photoSelected: model)
        let view = PhotoDetailView()
        let viewController = PhotoDetailViewController(view: view, viewModel: viewModel)
        self.navigationController.show(viewController, sender: self)
    }
}
