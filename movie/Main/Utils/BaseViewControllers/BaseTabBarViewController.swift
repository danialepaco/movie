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
    UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.MuliRegular(size: 8), NSAttributedString.Key.foregroundColor : Colors.mainBlue], for: .selected)
    
    self.tabBar.tintColor = Colors.mainBlue
    
    let seriesVC = SeriesTableVC()
    seriesVC.tabBarItem = UITabBarItem.init(title: "Series", image:  Images.movieIcon, tag: 0)
    
    let peopleVC = UIViewController()
    peopleVC.tabBarItem = UITabBarItem.init(title: "People", image:  Images.peopleIcon, tag: 1)
    
    let favoritesVC = FavoriteTableVC()
    favoritesVC.tabBarItem = UITabBarItem.init(title: "Favorites", image:  Images.favoriteOn, tag: 2)
    
    let tabBarList = [seriesVC,peopleVC,favoritesVC]
    
    self.viewControllers = tabBarList.map { UINavigationController(rootViewController: $0)}
  }
}
