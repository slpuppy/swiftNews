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
        self.setupControllers()
    }
    
    private func setupControllers(){
        let newsVM = NewsViewModel()
        let newsViewController = NewsViewController(viewModel: newsVM)
        let savedNewsViewController = SettingsViewController()
        
        let newsImage = UIImage(systemName: "newspaper")
        let savedNewsImage = UIImage(systemName: "heart")
        let selectedNewsImage = newsImage?.withTintColor(.systemBlue)
        let selectedSavedNewsImage = savedNewsImage?.withTintColor(.systemBlue)
        
        newsViewController.tabBarItem = UITabBarItem(title: nil, image: newsImage, selectedImage: selectedNewsImage)
        savedNewsViewController.tabBarItem = UITabBarItem(title: nil, image: savedNewsImage, selectedImage: selectedSavedNewsImage)
        viewControllers = [newsViewController, savedNewsViewController]
    }

}
