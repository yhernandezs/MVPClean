//
//  File.swift
//  TinderCat
//
//  Created by Yesid Hernandez on 30/12/19.
//  Copyright © 2019 Yesid Hernandez. All rights reserved.
//

import Foundation
import UIKit
import TinderCatCore

class BreedDetailCoordinator: BaseCoordinator<Breed> {

    required init(navigationController: UINavigationController) {
        super.init(navigationController: navigationController)
    }

    override func start(data: Breed) {
        let breedDetailViewController: BreedDetailViewController = BreedDetailViewController()
        breedDetailViewController.getBreed(data)
        breedDetailViewController.delegate = self
        self.navigationController.pushViewController(breedDetailViewController, animated: true)
    }
}

extension BreedDetailCoordinator: NavigateToNextController {

    func navigateToNextController() {
        let breedVoteCoordinator = BreedVoteCoordinator(navigationController: navigationController)
        childCoordinators.append(breedVoteCoordinator)
        breedVoteCoordinator.start()
    }
}
