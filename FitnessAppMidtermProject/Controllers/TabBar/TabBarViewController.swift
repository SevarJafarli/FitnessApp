//
//  TabBarViewController.swift
//  FitnessAppMidtermProject
//
//  Created by Sevar Jafarli on 11.04.24.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBar.tintColor = .primary
        self.tabBar.unselectedItemTintColor = .label
        self.tabBar.backgroundColor = .systemBackground
        
        let homeVC = UINavigationController(rootViewController: HomeViewController())
        
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: .home, tag: 0)
        
        let favoritesVC = UINavigationController(rootViewController: FavoritesViewController())
        
        favoritesVC.tabBarItem = UITabBarItem(title: "Saved", image: .bookmark, tag: 0)
        
        let profileVC = UINavigationController(rootViewController: ProfileViewController())
        
        profileVC.tabBarItem = UITabBarItem(title: "Profile", image: .profile, tag: 0)
        
        setViewControllers([homeVC, favoritesVC, profileVC], animated: true)
    }


}
