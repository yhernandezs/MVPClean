//
//  CatModule.swift
//  TinderCat
//
//  Created by Yesid Hernandez on 13/12/19.
//  Copyright © 2019 Yesid Hernandez. All rights reserved.
//

import UIKit
import TinderCatCore

class CatModule: AbstractModule {
    override func inject(viewController: UIViewController) {

        let presenter = CatPresenter(catInteractor: interactorModule.getCatsInteractor)
        (viewController as? CatViewController)?.presenter = presenter
    }
}
