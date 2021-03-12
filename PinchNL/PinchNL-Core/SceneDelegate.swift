//
//  SceneDelegate.swift
//  PinchNL
//
//  Created by Andre Nogueira on 03/03/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let navigation = UINavigationController()
        /// MVVM:
            let coordinator = PinchCoordinator(navigationController: navigation)
            coordinator.startAlbum()
        /// VIP:
//        let factory = PinchAlbumFactory()
//        let viewController = factory.setup()
//        navigation.pushViewController(viewController, animated: true)
        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
    }
}

