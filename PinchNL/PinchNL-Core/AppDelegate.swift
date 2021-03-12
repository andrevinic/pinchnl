//
//  AppDelegate.swift
//  PinchNL
//
//  Created by Andre Nogueira on 03/03/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window : UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        if #available(iOS 13, *) {} else {
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
//            let factory = PinchAlbumFactory()
//            let viewController = factory.setup()
//            navigation.pushViewController(viewController, animated: true)
            /// VIP END
            
            window = UIWindow(frame: UIScreen.main.bounds)
            window?.rootViewController = navigation
            window?.makeKeyAndVisible()
        }
       
        return true
    }

}

