//
//  BreedVoteCoordinator.swift
//  TinderCat
//
//  Created by Yesid Hernandez on 20/01/20.
//  Copyright © 2020 Yesid Hernandez. All rights reserved.
//

import Foundation
import UIKit
import TinderCatCore

class BreedVoteCoordinator: BaseCoordinator<Any?> {

    required init(navigationController: UINavigationController) {
        super.init(navigationController: navigationController)
    }
    
    override func start() {
        let breedVoteViewController: BreedVoteViewController = BreedVoteViewController()
        self.navigationController.pushViewController(breedVoteViewController, animated: true)
    }
}
