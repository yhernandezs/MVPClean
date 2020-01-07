//
//  BreedDetailModule.swift
//  TinderCat
//
//  Created by Yesid Hernandez on 23/12/19.
//  Copyright © 2019 Yesid Hernandez. All rights reserved.
//

import Foundation
import TinderCatCore
import UIKit

class BreedDetailModule: AbstractModule {
    override func inject(viewController: UIViewController) {

        let presenter = BreesDetailPresenter(breedInteractor: interactorModule.getBreedDetailInteractor)
        (viewController as? BreedDetailViewController)?.presenter = presenter
    }
}
