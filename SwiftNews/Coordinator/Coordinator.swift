//
//  Coordinator.swift
//  SwiftNews
//
//  Created by Gabriel Puppi on 16/05/24.
//

import UIKit

protocol Coordinator: AnyObject {
    
    var navigationController: UINavigationController { get set }
    
    func start()
}


