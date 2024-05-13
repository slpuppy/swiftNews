//
//  CustomTabBarController.swift
//  SwiftNews
//
//  Created by Gabriel Puppi on 13/05/24.
//

import UIKit

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = .systemBlue
        tabBar.barTintColor = UIColor(hex: "212121")
        self.setupControllers()
    }
    
    private func setupControllers(){
        let newsVM = NewsViewModel()
        let newsViewController = NewsViewController(viewModel: newsVM)
        let savedNewsViewController = SavedNewsViewController()
        
       newsViewController.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "newspaper"), selectedImage: nil)
       savedNewsViewController.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "heart"), selectedImage: nil)


        viewControllers = [newsViewController, savedNewsViewController]
    }
}
