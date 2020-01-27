//
//  BreedContract.swift
//  TinderCat
//
//  Created by Yesid Hernandez on 23/12/19.
//  Copyright © 2019 Yesid Hernandez. All rights reserved.
//

import Foundation
import TinderCatCore

protocol BreedDetailViewType: BaseView {
    func displayBreed(_ breed: BreedDetail)
    func showTinderController()
}

protocol BreedDetailPresenterType: BasePresenterProtocol {
    func getBreed(_ id: String)
    func showTinder()
    func addToFavorite()
}
