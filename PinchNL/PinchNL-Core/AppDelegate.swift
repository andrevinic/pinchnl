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
            let coordinator = PinchCoordinator(navigationController: navigation)
            coordinator.startAlbum()
            window = UIWindow(frame: UIScreen.main.bounds)
            window?.rootViewController = navigation
            window?.makeKeyAndVisible()
        }
       
        return true
    }

}

