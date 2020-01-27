//
//  BreedVoteContract.swift
//  TinderCat
//
//  Created by Yesid Hernandez on 27/01/20.
//  Copyright © 2020 Yesid Hernandez. All rights reserved.
//

import Foundation
import TinderCatCore

protocol BreedVoteViewType: BaseView {
    func dismiss()
    func showProgress()
    func hideProgress()
    func displayFavoriteBreed(breeds: [FavoriteBreed])
}

protocol BreedVotePresenterType: BasePresenterProtocol {
    func getFovoriteBreed()
}
