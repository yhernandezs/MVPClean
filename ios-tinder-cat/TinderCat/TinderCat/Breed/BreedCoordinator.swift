//
//  CatViewCoordinator.swift
//  TinderCat
//
//  Created by Yesid Hernandez on 5/12/19.
//  Copyright © 2019 Yesid Hernandez. All rights reserved.
//

import Foundation
import UIKit
import TinderCatCore

class BreedCoordinator: BaseCoordinator<Any?> {

    required init(navigationController: UINavigationController) {
        super.init(navigationController: navigationController)
    }
    override func start() {
        let catViewController : BreedViewController = BreedViewController()
        catViewController.delegate = self
        self.navigationController.viewControllers = [catViewController]
    }
}

extension BreedCoordinator: CatViewControllerDelegate {
    
    func navigateToNextPage(breed: Breed?) {
        guard let breed = breed else { return }
        
        let breedDetailCoordinator = BreedDetailCoordinator(navigationController: navigationController)
        childCoordinators.append(breedDetailCoordinator)
        breedDetailCoordinator.start(data: breed)
    }
}
