//
//  File.swift
//  TinderCat
//
//  Created by Yesid Hernandez on 30/12/19.
//  Copyright © 2019 Yesid Hernandez. All rights reserved.
//

import Foundation
import UIKit

protocol BackToFirstViewControllerDelegate: class {
    
    func navigateBackToFirstPage(newOrderCoordinator: BreedDetailCoordinator)
    
}

class BreedDetailCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    
    unowned let navigationController:UINavigationController
    
    // We use this delegate to keep a reference to the parent coordinator
    weak var delegate: BackToFirstViewControllerDelegate?
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let secondViewController : BreedDetailViewController = BreedDetailViewController()
        secondViewController.delegate = self 
        self.navigationController.pushViewController(secondViewController, animated: true)
    }
}

extension BreedDetailCoordinator : BreedDetailViewControllerDelegate {
    
    func navigateToThirdPage() {
    }
    
    func navigateToFirstPage() {
        self.delegate?.navigateBackToFirstPage(newOrderCoordinator: self)
    }
}
