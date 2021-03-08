//
//  PinchCoordinator.swift
//  PinchNL
//
//  Created by Andre Nogueira on 07/03/21.
//

import Foundation
import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
class PinchCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let provider = PinchAPIProvider<PinchAPI>()
        let service = AlbumService(apiProvider: provider)
        let repository = AlbumRepository(service: service)
        let viewModel = AlbumViewModel(repository: repository)
        let view = AlbumView()
        let viewController = AlbumViewController(view: view, viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: false)
    }
    
    
}
