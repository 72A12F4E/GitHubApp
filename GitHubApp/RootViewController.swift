//
//  RootViewController.swift
//  GitHubApp
//
//  Created by Blake McAnally on 7/24/21.
//

import UIKit

class RootViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    private func setupTabBar() {
        let home = HomeViewController()
        home.tabBarItem = UITabBarItem(
            title: "Home",
            image: UIImage(systemName: "house"),
            selectedImage: UIImage(systemName: "house.fill")
        )
        
        setViewControllers([
            UINavigationController(rootViewController: home),
        ], animated: true)
    }
}

