//
//  Router.swift
//  movie
//
//  Created by Daniel Parra on 4/20/19.
//  Copyright © 2019 danialepaco. All rights reserved.
//

import UIKit

class Router: NSObject {
    
    private static var window: UIWindow? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return nil
        }
        return appDelegate.window
    }
    
    static func setRootViewController(viewController: UIViewController) {
        
        let navigationController = UINavigationController()
        navigationController.viewControllers = [viewController]
        window?.rootViewController = navigationController
    }
    
    // Presents HomeViewController
    static func presentHomeViewController() {
        let vc = BaseTabBarViewController()
        window?.rootViewController = vc
    }
}
