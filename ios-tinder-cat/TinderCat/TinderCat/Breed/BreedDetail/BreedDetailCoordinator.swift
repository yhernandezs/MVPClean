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

    weak var delegate: BackToFirstViewControllerDelegate?

    required init(navigationController: UINavigationController) {
        super.init(navigationController: navigationController)
    }
    
    override func start(data: Breed) {
        let secondViewController: BreedDetailViewController = BreedDetailViewController()
        secondViewController.getBreed(data)
        self.navigationController.pushViewController(secondViewController, animated: true)
    }
}

