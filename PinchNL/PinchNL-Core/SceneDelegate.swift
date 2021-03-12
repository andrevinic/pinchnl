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
        /** INSTRUCTIONS:
                
                IF YOU CHOOSE MVVM TARGET,
                COMMENT VIP START/END
                
                IF YOU CHOOSE VIP TARGET, COMMENT MVVM START/END
         */
        /// MVVM START:
            let coordinator = PinchCoordinator(navigationController: navigation)
            coordinator.startAlbum()
        /// MVVM END
        
        /// VIP START:
//        let factory = PinchAlbumFactory()
//        let viewController = factory.setup()
//        navigation.pushViewController(viewController, animated: true)
        /// VIP END

        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
    }
}

