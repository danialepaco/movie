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
  
  static func presentLoginViewController() {
    NavStyle.setupNavBarAppearance()
    let vc = LoginVC()
    window?.rootViewController = vc
  }
  
  static func presentHomeViewController() {
    NavStyle.setupNavBarAppearance()
    let vc = BaseTabBarViewController()
    window?.rootViewController = vc
  }
}
