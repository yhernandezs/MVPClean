//
//  CatModule.swift
//  TinderCat
//
//  Created by Yesid Hernandez on 13/12/19.
//  Copyright © 2019 Yesid Hernandez. All rights reserved.
//

import UIKit
import TinderCatCore

class BreedModule: AbstractModule {
    override func inject(viewController: UIViewController) {

        let presenter = BreedPresenter(catInteractor: interactorModule.getCatsInteractor)
        (viewController as? BreedViewController)?.presenter = presenter
    }
}
