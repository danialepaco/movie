//
//  BaseTabBarViewController.swift
//  movie
//
//  Created by Daniel Parra on 4/20/19.
//  Copyright © 2019 danialepaco. All rights reserved.
//

import UIKit

class BaseTabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.MuliRegular(size: 8), NSAttributedString.Key.foregroundColor : Colors.tabBarText], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.MuliRegular(size: 8), NSAttributedString.Key.foregroundColor : Colors.lightBlue], for: .selected)
        
        self.tabBar.tintColor = Colors.lightBlue
        self.tabBar.barTintColor = UIColor.white
        
        let seriesVC = UIViewController()
        seriesVC.tabBarItem = UITabBarItem.init(title: "Series", image:  Images.movieIcon, tag: 0)
        
        let peopleVC = UIViewController()
        peopleVC.tabBarItem = UITabBarItem.init(title: "People", image:  Images.peopleIcon, tag: 1)

        let favoritesVC = UIViewController()
        favoritesVC.tabBarItem = UITabBarItem.init(title: "Favorites", image:  Images.favoriteIcon, tag: 2)
        
        let tabBarList = [seriesVC,peopleVC,favoritesVC]
        
        self.viewControllers = tabBarList.map { UINavigationController(rootViewController: $0)}
    }
}
