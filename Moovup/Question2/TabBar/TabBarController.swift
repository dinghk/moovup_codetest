//
//  TabBarController.swift
//  Moovup
//
//  Created by Ding Lo on 13/3/2024.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Create and configure the view controllers
        let homeViewController = HomeViewController()
        let mapViewController = MapViewController()

        // Set the view controllers for the tab bar
        self.setViewControllers([homeViewController, mapViewController], animated: false)

        // Configure the tab bar items
        homeViewController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        mapViewController.tabBarItem = UITabBarItem(title: "Map", image: UIImage(systemName: "map"), tag: 1)
        
        tabBar.backgroundColor = .white
    }

}
