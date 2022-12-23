//
//  AppDelegate.swift
//  repochka
//
//  Created by Kirill Dev on 12.12.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let nav1 = UINavigationController()
        let mainView = LogInVC(nibName: nil, bundle: nil)
        nav1.viewControllers = [mainView]
        self.window?.rootViewController = nav1
        self.window?.makeKeyAndVisible()
        return true
    }
}

