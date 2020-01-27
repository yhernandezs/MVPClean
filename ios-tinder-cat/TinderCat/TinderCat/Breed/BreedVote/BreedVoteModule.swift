//
//  BreedVoteModule.swift
//  TinderCat
//
//  Created by Yesid Hernandez on 27/01/20.
//  Copyright © 2020 Yesid Hernandez. All rights reserved.
//
import UIKit
import Foundation
import TinderCatCore

class BreedVoteModule : AbstractModule {
    override func inject(viewController: UIViewController) {

        let presenter = BreedVotePresenter(favoriteBreedInteractor: interactorModule.getFavoritesInteractor)
        (viewController as? BreedVoteViewController)?.presenter = presenter
    }
}
