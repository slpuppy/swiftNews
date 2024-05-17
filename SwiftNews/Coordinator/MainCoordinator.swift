//
//  MainCoordinator.swift
//  SwiftNews
//
//  Created by Gabriel Puppi on 16/05/24.
//

import UIKit

class MainCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vm = NewsViewModel(coordinator: self)
        let vc = NewsViewController(viewModel: vm)
        navigationController.pushViewController(vc, animated: false)
    }
    
    func presentArticle(article: Article) {
        let vc = ArticleViewController(article: article)
        vc.modalPresentationStyle = .popover
        navigationController.present(vc, animated: true)
    }
    
}
